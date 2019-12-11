class Financial < ApplicationRecord
  attr_reader :ins_cert_remote_url, :wcb_cert_remote_url, :void_check_remote_url
  has_attached_file :ins_cert
  do_not_validate_attachment_file_type :ins_cert
  has_attached_file :wcb_cert
  do_not_validate_attachment_file_type :wcb_cert
  has_attached_file :void_check
  do_not_validate_attachment_file_type :void_check

  belongs_to :contract, optional: true
  has_many :trades, dependent: :destroy
  accepts_nested_attributes_for :trades


  def ins_cert_remote_url=(url_value)
    self.ins_cert = URI.parse(url_value)
    @ins_cert_remote_url = url_value
  end

  def wcb_cert_remote_url=(url_value)
    self.wcb_cert = URI.parse(url_value)
    @wcb_cert_remote_url = url_value
  end

end
