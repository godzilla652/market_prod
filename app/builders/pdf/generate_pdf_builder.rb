class Pdf::GeneratePdfBuilder < SimpleDelegator
  def initialize(estimator)
    super
  end

  def build!(estimator)
    html = ApplicationController.new.render_to_string(
        layout: false,
        template: '/admin/estimators/generate_pdf.html.erb',
        locals: {:@estimator => estimator})

    kit = PDFKit.new(html, lowquality: true, page_size: 'A4')
    kit.to_file("#{PDF_PUBLIC_PATH}/estimator/quote_#{estimator.id}_#{estimator.address.gsub('/','').gsub(' ','_')}.pdf")
  end
end
