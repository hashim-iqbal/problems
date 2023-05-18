class Pdf
  attr_reader :file_path

  # I can use file_path in process method but for generically i'm demanding file_path to process multiple pdf files.

  def initialize(file_path)
    @file_path = file_path
  end

  def process
    out_put_path = 'output.pdf'
    command = "gs -sDEVICE=pdfwrite -dPDFA=1 -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=#{out_put_path} #{file_path}"

    system(command) # I've verified the generated pdf on this site https://www.pdfen.com/pdf-a-validator
  end
end

Pdf.new('lorem-ipsum.pdf').process
