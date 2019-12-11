class Task < ApplicationRecord

  Paperclip::DataUriAdapter.register

  has_paper_trail ignore: %i[
    created_at updated_at
    photo_content_type photo_file_size photo_updated_at
    photo1_content_type photo1_file_size photo1_updated_at
    photo2_content_type photo2_file_size photo2_updated_at
    photo3_content_type photo3_file_size photo3_updated_at
    photo4_content_type photo4_file_size photo4_updated_at
    photo5_content_type photo5_file_size photo5_updated_at
    photo6_content_type photo6_file_size photo6_updated_at
    photo7_content_type photo7_file_size photo7_updated_at
  ]

  SPECIFIC_PERMISSIONS = %w[]

  attr_accessor :delete_photo
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo1
  has_attached_file :photo1, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo1, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo2
  has_attached_file :photo2, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo2, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo3
  has_attached_file :photo3, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo3, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo4
  has_attached_file :photo4, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo4, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo5
  has_attached_file :photo5, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo5, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo6
  has_attached_file :photo6, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo6, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  attr_accessor :delete_photo7
  has_attached_file :photo7, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :photo7, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  enum status: {pending: 'pending',
                posted: 'posted',
                confirmed: 'confirmed',
                done: 'done',
                done_confirmed: 'done_confirmed'}

  validates_presence_of :title
  validate :update_only_dates_on_approved_validation, on: :update
  belongs_to :owner, optional: true, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :concierge, optional: true, :class_name => "User", :foreign_key => "concierge_id"
  belongs_to :project_task, optional: true

  has_many :task_images
  has_many :complaints, dependent: :destroy
  has_many_attached :documents
  has_many :suggestions, class_name: "TaskSuggestion", foreign_key: "task_id", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favorite_tasks, dependent: :destroy
  has_many :users_pendings_task, dependent: :destroy
  has_one :place, dependent: :destroy
  has_many :payments, class_name: "TaskPayment", foreign_key: "task_id", dependent: :destroy
  has_many :line_tasks, dependent: :destroy
  has_many :line_estimators, dependent: :destroy
  has_many :ratings
  has_many :lines, class_name: 'LineEstimator'

  has_one :invoice, as: :payable

  accepts_nested_attributes_for :place
  accepts_nested_attributes_for :line_tasks
  #validates :documents, blob: {size_range: 1..50.megabytes}
  #paginates_per 2


  #after_create :payment
  before_destroy :destroyed_push
  after_create :save_new_suggestion
  after_create :create_invoice
  before_validation :update_photos

  scope :not_paid, -> { joins(:invoice).where(invoices: { state: 'not_paid' }) }
  scope :paid, -> { joins(:invoice).where(invoices: { state: 'paid' }) }
  scope :active, -> { where.not status: 'done_confirmed' }

  def paid?
    invoice&.paid?
  end

  def not_paid?
    invoice&.not_paid?
  end

  def update_only_dates_on_approved_validation
    return if concierge_id_was.nil? || status_was == 'posted'
    diff = changed - %w[date_start date_limit fact_start fact_end status confirmed_at completed_at]
    errors.add :base, 'Allowed to edit only dates (plan start, plan end and actual start)' if diff.any?
  end

  def editable?
    concierge_id.nil? || status == 'posted'
  end

  def checked_completed_quota
    lines&.take&.checked_completed_quota
  end

  def photo_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo = data
    end
  end

  def photo1_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo1 = data
    end
  end

  def photo2_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo2 = data
    end
  end

  def photo3_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo3 = data
    end
  end

  def photo4_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo4 = data
    end
  end

  def photo5_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo5 = data
    end
  end

  def photo6_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo6 = data
    end
  end

  def photo7_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo7 = data
    end
  end

  def save_new_suggestion
    unless tender?
      TaskSuggestion.create(user_id: concierge_id, task_id: id, price: budget, proposed_text: title, hire_read: true, concierge_read: true)
    end
  end

  def rating_present
    ratings.present? and done_confirm?
  end

  def full_sum
    sum = order_changes.present? ? order_changes.sum(:budget) : 0
    total = budget + sum
  end

  def total_sum
    (budget || 0) + line_sum
  end

  def profent_full
    budget_tax + total_sum
  end

  def budget_tax
    total_sum.to_f * gst_calc / 100.0
  end

  def line_sum
    #sum = order_changes_confirmed.present? ? order_changes_confirmed.sum(:budget) : 0
    #sum2 = order_back.present? ? order_back.sum(:budget) : 0
    #sum - sum2
    order_changes_confirmed.present? ? order_changes_confirmed.sum(:budget) : 0
  end

  def destroyed_push
    feed = FeedNotification.create(notification_type: 'destroy_task', task_id: self.id)
    feed.save
  end

  def is_done
    Task.where(id: self.id, status: 'done').exists?
  end

  def done_confirm?
    Task.where(id: self.id, status: 'done_confirmed').exists?
  end

  def owner?(user)
    self.owner == user
  end

  def all_payments?(user)
    TaskPayment.where(hire: true, task_id: self.id, user_id: user.id).count
  end

  def accepted?
    !self.concierge_id.nil?
  end

  def concierge?(user_id)
    self.concierge_id == user_id
  end

  def self.with_suggestions(ids)
    joins("LEFT JOIN `task_suggestions` ON  tasks.suggestion_id = task_suggestions.id")
        .where(tasks: {id: ids, status: 'posted'})
        .order("task_suggestions.updated_at DESC;")
  end

  def create_invoice
    build_invoice.save
  end

  def favorite?(user)
    FavoriteTask.where(user_id: user.id, task_id: self.id).exists?
  end

  def suggestion?(user)
    TaskSuggestion.where(user_id: user.id, task_id: self.id).exists?
  end

  def order_changes
    line_tasks.where(type_line: 'Change Order')
  end

  def order_changes_new
    line_tasks.where(type_line: 'Change Order', status: 'new')
  end

  def order_changes_confirmed
    line_tasks.where(type_line: 'Change Order', status: 'confirmed')
  end

  def order_back
    line_tasks.where(type_line: 'Back Charge')
  end

  def number_shange_order
    line = order_changes.first
    if line
      line.created_at.strftime('%Y%m%d')
    end
  end

  def budget_round
    sprintf('%.2f', budget)
  end

  def gst_calc
    concierge.present? ? concierge&.contract&.gst_percent : 5
  end

  def tax_invoice
    budget*gst_calc/100
  end

  def total_invoice
    tax_invoice+budget
  end

  def generate_pdf
    html = <<-HTML
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>ASTRA</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<style type="text/css">
html {
    height: 0;
}
body {
    font-family: Arial,sans-serif;
    font-size: 12px;
    line-height: 1.5;
    color: #333333;
}
.container{
    width: 100%;
    margin: 0 auto;
}
.logo img{
    max-width: 150px;
    height: auto;
}
table.top-table{
    margin-top: 40px;
}
table{
    width: 100%;

    border-collapse: collapse;
}
th{
    text-align: left;
    padding: 8px 16px;
}
td{
    vertical-align: top;
    padding: 8px 16px;
}
.total-td{
    border-left: 1px solid #fff;
    border-bottom: 1px solid #fff;
    text-align: right;
    font-weight: bold;
}
.text-strong{
    font-weight: bold;
}
.text-underline{
    text-decoration: underline;
}
.subtitle{
    font-size: 12px;
    font-weight: bold;
    text-align: right;
    padding: 30px 0;
}
</style>

</head>
<body>
    <div class="container">
        <table class="top-table">
            <tbody>
                <tr>
                    <td width="50%">
                        <div class="logo">
                            <img src="https://astra-management.ca/logo.png">
                        </div>
                        <p>ASTRA Construction Management<br>
                        888 – 3rd Street SW, 10th Floor<br>
                        Bankers Hall, West Tower<br>
                        Calgary, Alberta, T2P 5C5</p>
                    </td>
                    <td width="50%" class="text-strong">
                        <span style='font-size: 18px'>PURCHASE ORDER NO. #{id}</span><br>
                        <p> This number MUST appear on all invoices, <br>
                        packing slips and correspondence.<br>
                        Plan start: #{date_start.strftime("%m/%d/%y") if date_start} <br>
                        Plan end:  #{date_limit.strftime("%m/%d/%y") if date_limit} <br>
                        Project №: #{project_task.number}<br>
                        Project name: #{project_task.name}<br>
                        Category: #{task_type}</p>
                    </td>
                </tr>
            </tbody>
        </table>

        <table class="middle-table">
            <tbody>
                <tr>
                    <td width="50%">
                        <p class="text-strong">To</p>
                        <p>       #{(concierge.contract.legal_title if concierge.contract) if concierge}</br>
                            #{(concierge.contract.views_mailing_address if concierge.contract) if concierge }</p>
                    </td>
                    <td width="50%">
                        <p>Please submit your invoices electronically to:<br>
                        <span class="text-underline">#{Settings['email.sender']}</span></p>
                        <p>One invoice per e-mail, with the service address, indicated in the subject line Ordered by:</p>
                    </td>
                </tr>
            </tbody>
        </table>

        <table class="bottom-table" border="1">
            <tbody>
                <tr class="text-strong">
                    <td colspan="2" width="50%">Ordered by: Astra-Group</td>
                    <td colspan="4" width="50%">Requested by: #{owner.full_name if owner}</td>
                </tr>
                <tr>
                    <td colspan="2" width="50%">
                        <p class="text-strong">Bill To:</p>
                        <p>ASTRA Construction Management<br>
                        888 – 3rd Street SW, 10th Floor<br>
                        Bankers Hall, West Tower<br>
                        Calgary, Alberta, T2P 5C5</p>
                    </td>
                    <td colspan="4" width="50%">
                        <p class="text-strong">Ship To:</p>
                        <p>#{place.address if place}</p>
                    </td>
                </tr>
                <tr>
                    <th width="10%">Part No.</th>
                    <th width="40%">Description/Details</th>
                    <th width="12.5%">Qty</th>
                    <th width="12.5%">Unit of Measure</th>
                    <th width="12.5%">Unit Price</th>
                    <th width="12.5%">Total Cost</th>
                </tr>
                <tr>
                    <td width="10%"></td>
                    <td width="40%">#{description}</td>
                    <td width="12.5%">1.0000</td>
                    <td width="12.5%"></td>
                    <td width="12.5%">#{budget_round}</td>
                    <td width="12.5%">#{budget_round}</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">Subtotal</td>
                    <td width="12.5%">#{budget_round}</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">GST or HST Tax:</td>
                    <td width="12.5%">#{sprintf('%.2f', (tax = budget * gst_calc / 100))}</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">Sales Tax<sup>¹</sup>:</td>
                    <td width="12.5%">0.00</td>
                </tr>
                <tr>
                    <td colspan="5" width="88.5%" class="total-td">Total:</td>
                    <td width="12.5%">#{sprintf('%.2f', (budget + tax))}</td>
                </tr>
            </tbody>
        </table>
        <p class="subtitle"><sup>¹</sup>Either PST or QST dependent on the province</p>
    </div>
</body>

</html>
    HTML
    kit = PDFKit.new(html, lowquality: true, page_size: 'A4')
    kit.to_file("#{PDF_PUBLIC_PATH}#{work_order_pdf_path}")
  end

  def work_order_pdf_path
    "/purchare/purchase_order_#{id}.pdf"
  end

  def generate_pdf_invoice
    Pdf::InvoiceOrderBuilder.new(self).build!
  end

  def invoice_pdf_path
    "/invoice/invoice_order_#{id}.pdf"
  end

  def generate_pdf_charge_back(line)
    Pdf::BackChargeBuilder.new(self).build!(line)
  end

  def generate_pdf_change_order(line)
    Pdf::ChangeOrderBuilder.new(self).build!(line)
  end

  def generate_pdf_change_order_invoice(line)
    Pdf::InvoiceChangeOrderBuilder.new(self).build!(line)
  end

  private

  def update_photos
    photo.clear if delete_photo == '1'
    photo1.clear if delete_photo1 == '1'
    photo2.clear if delete_photo2 == '1'
    photo3.clear if delete_photo3 == '1'
    photo4.clear if delete_photo4 == '1'
    photo5.clear if delete_photo5 == '1'
    photo6.clear if delete_photo6 == '1'
    photo7.clear if delete_photo7 == '1'
  end
end
