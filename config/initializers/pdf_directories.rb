if Rails.env.test?
  PDF_PUBLIC_PATH = "#{Rails.public_path}/test"
else
  PDF_PUBLIC_PATH = Rails.public_path
end

def create_pdf_directories
  ['invoice', 'back', 'change'].each do |dir|
    pdf_dir = "#{PDF_PUBLIC_PATH}/#{dir}"
    FileUtils.mkdir_p(pdf_dir) unless File.exists?(pdf_dir)
  end
end

create_pdf_directories
