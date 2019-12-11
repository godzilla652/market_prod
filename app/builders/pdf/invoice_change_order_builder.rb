class Pdf::InvoiceChangeOrderBuilder < SimpleDelegator
  def initialize(task)
    super
  end

  def build!(line)
    html = ApplicationController.new.render_to_string(
        layout: false,
        template: '/admin/tasks/generate_pdf_change_order.html.erb',
        locals: {:@entity => line, invoice: true})

    kit = PDFKit.new(html, lowquality: true, page_size: 'A4')
    kit.to_file("#{PDF_PUBLIC_PATH}#{line.invoice_order_pdf_path}")
  end
end
