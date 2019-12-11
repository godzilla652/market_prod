class AddAttachmentFilesToFinancials < ActiveRecord::Migration[5.0]
  def up
    add_attachment :financials, :ins_cert
    add_attachment :financials, :wcb_cert
  end

  def down
    remove_attachment :financials, :ins_cert
    remove_attachment :financials, :wcb_cert
  end
end
