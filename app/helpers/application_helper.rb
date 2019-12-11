module ApplicationHelper
  def file_date(public_file)
    filename = "#{Rails.public_path}#{public_file}"
    File.ctime(filename).strftime("%Y/%m/%d") if File.file?(filename)
  end

  def date_full(date)
    date.strftime("%Y-%m-%d") if date.present?
  end

  def contracts_pending_count
    Contract.where(status: :pending).count
  end

  def humanize_seconds(seconds)
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end

  def active_link_to(name = nil, url = {}, html_options = {}, &block)
    name, url, html_options = block, name, url if block_given?
    html_options[:class] = "#{html_options[:class]} active" if is_current_page?(url)

    options ||= {}
    html_options = convert_options_to_data_attributes(options, html_options)
    html_options[:href] ||= url_for(url)

    content_tag :a, name || url, html_options, &block
  end

  def is_current_page?(path)
    url_for(path) == request.path
  end

end
