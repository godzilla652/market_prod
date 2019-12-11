require "render_anywhere"

class Pdf::InvoiceOrderBuilder < SimpleDelegator

  include RenderAnywhere

  def initialize(task)
    super
  end

  def build!
    html = render template: "admin/invoices/invoice_report", layout: false, locals: { task: self }
    kit = PDFKit.new(html, lowquality: true, page_size: 'A4')
    kit.to_file("#{PDF_PUBLIC_PATH}#{invoice_pdf_path}")
  end
end
