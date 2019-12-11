class UserMailer < ApplicationMailer
  default from: "Astra <#{Settings['email.sender']}>"

  def estimator_new(email, id)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @e_id = id
    @estimator = Estimator.find(id)
    mail(:to => email, :subject => "New Quote")
  end

  def welcome_email(email, team)
    @dear = if team
              "Dear User"
            else
              "Dear Contractor"
            end
    mail(:to => email, :subject => "Thanks for registering")
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
  end

  def welcome_email_admin(email, contract)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    mail(:to => email, :subject => "New applicant")
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @contract = contract
  end

  def createuser_email(user, password)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @user = user
    @password = password
    @dear = if user.contract.present?
              if user.contract.team?
                "Dear User"
              else
                "Dear Contractor"
              end
            else
              "Dear Contractor"
            end
    @team = user.contract.team? ? true : false
    mail(:to => user.email, :subject => @dear)
  end

  def declineuser_email(email)
    @dear = "Dear Contractor"

    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    mail(:to => email, :subject => @dear)
  end

  def declineuser2_email(contract, email, messaged)
    @dear = if contract.team?
              "Dear User"
            else
              "Dear Contractor"
            end

    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @mass = messaged
    mail(:to => email, :subject => @dear)
  end

  def editcontr_email(contract, email, messaged)
    @dear = if contract.team?
              "Dear User"
            else
              "Dear Contractor"
            end
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @messaged = messaged
    mail(:to => email, :subject => @dear)
  end

  def accepted_task(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Work Order: #{desc}")
  end

  def accepted_task_conc(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Work Order: #{desc}")
  end

  def accepted_task_astra(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Work Order: #{desc}")
  end

  def confirm_task(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Work confirmed: #{desc}")
  end

  def send_change_order(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Change order!")
  end

  def new_back_line(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Back Charge!")
  end

  def send_back_order_app(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    mail(:to => email, :subject => "Back Charge!")
  end

  def confirm_task_astra(email, task_id, desc)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @task_id = task_id
    @desc = desc
    @task = Task.find(@task_id)
    mail(:to => email, :subject => "Work confirmed: Invoice #{task_id}, #{@task.concierge.legal_title if @task.concierge}. #{@task.project_task.name if @task.project_task} #{@task.project_task.number if @task.project_task}")
  end

  def done_task_astra(email, contractor, title)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @contractor = contractor
    @title = title
    mail(:to => email, :subject => "Work confirm! #{title}")
  end

  def new_change_order(email, name, desc, address, task_id, user_id, budget, id)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @user_id = user_id
    @task_id = task_id
    @name = name
    @desc = desc
    @address = address
    @budget = budget
    @id = id
    mail(:to => email, :subject => "Change Order from Astra-Tenders")
  end
  
  def new_task(email, name, desc, address, task_id, user_id, budget)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @user_id = user_id
    @task_id = task_id
    @name = name
    @desc = desc
    @address = address
    @budget = budget
    mail(:to => email, :subject => "You've been assigned new task.")
  end

  def new_task_not_worker(email, name, desc, address, task_id, user_id, budget)
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]
    @user_id = user_id
    @task_id = task_id
    @name = name
    @desc = desc
    @address = address
    @budget = budget
    mail(:to => email, :subject => "New job offer from Astra-Tenders.")
  end
end
