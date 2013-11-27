path_to_wkhtmltopdf = Rails.env.production? ?
  Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s :
  '/Users/johno/.rvm/gems/ruby-2.0.0-p353/bin/wkhtmltopdf'

puts '!!!!!!!!!!!!!!!!!!!!!!!!!' + path_to_wkhtmltopdf

WickedPdf.config = {
  exe_path: path_to_wkhtmltopdf,
  wkhtmltopdf: path_to_wkhtmltopdf
}