class WelcomeController < ApplicationController
  include ActiveStorage::SendZip
  include Pundit

  def cities
    @cities = Contract.cities_canada
    respond_to do |format|
      format.json { render :layout => false }
    end
  end

  def sign_in_for_api
    if params[:token_web].present?
      if params[:user_email].present?
        user = User.find_by_email(params[:user_email])
        if user.present?
          if user.token_web == params[:token_web]
            sign_in(user)
            if params[:url]
              redirect_to params[:url]
            else
              redirect_to root_url
            end
          else
            redirect_to root_url
          end
        else
          redirect_to root_url
        end
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  def properties

    url = URI.parse("http://134.209.61.155/astraproperties/public/loginrequest/#{current_user.email}/#{current_user.token_web}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body
  end

  def categories
    @categories = Category.where(active: true)
    respond_to do |format|
      format.json { render :layout => false }
    end
  end

  def index
    begin
      authorize :AdminPanel, :index?
      redirect_to admin_project_tasks_path
    rescue Exception => e
      redirect_to('https://astra-management.ca/success_password.html')
    end
  end

  def accept_line
    if params[:line_id]
      begin
        line = LineTask.find(params[:line_id])
        if line
          if line.status == "confirmed"
            redirect_to 'https://astra-management.ca/accepted.html'
          else
            line.update(status: "confirmed")
            redirect_to 'https://astra-management.ca/success-3.html'
          end
        end
      rescue
        redirect_to 'https://astra-management.ca/success-3.html'
      end
    end
  end

  def attachments
    @entity = Task.find(params[:id])
    respond_to do |format|
      format.zip { send_zip @entity.documents, filename: "attacments-#{@entity.title}.zip" }
    end
  end

  def email
    respond_to do |format|
      format.json { render :layout => false }
    end
  end

  def accept_task
    if params[:task_id]
      @entity = Task.find(params[:task_id].to_i)
      if @entity.status == 'posted'

        @entity.update_attributes(status: 'confirmed', confirmed_at: Time.now, fact_start: Date.current)
        #byebug
        concierge = @entity.concierge
        owner = @entity.owner
        pdf = @entity.generate_pdf
        UserMailer.accepted_task_conc(@entity.concierge.email, @entity.id, @entity.title).deliver if pdf.present?
        UserMailer.accepted_task_astra(Settings['email.work_order'], @entity.id, @entity.title).deliver if pdf.present?
        message = Message.create(
            author_id: concierge.id,
            recipient_id: owner.id,
            message_body: "#{@entity.concierge.first_name} #{@entity.concierge.last_name} has accepted your work offer",
            task_id: @entity.id,
            system: true,
            suggestion_id: @entity.suggestion_id
        )

        feed = FeedNotification.create(
            owner_id: concierge.id,
            user_id: message.recipient_id,
            task_title: @entity.title,
            message: "#{@entity.concierge.first_name} #{@entity.concierge.last_name} has accepted your work offer",
            notification_type: 'new_message',
            task_id: @entity.id,
            suggestion_id: @entity.suggestion_id,
            task_owner_id: @entity.owner_id
        )
        if feed.save!
          NotificationsWorker.perform_async(feed.id)
        end
        redirect_to 'https://astra-management.ca/success-2.html'
      else
        redirect_to 'https://astra-management.ca/accepted.html'
      end
    end
  end
end
