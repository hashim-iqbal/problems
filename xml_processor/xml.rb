require_relative 'xml_parser'

class Xml
  def self.process
    puts '-------- Processing Compressed file --------'
    puts XmlParser.new('xml_uncompressed.xml').data

    puts '-------- Processing Uncompressed file --------'
    puts XmlParser.new('xml_compressed.xml').data
  end
end

Xml.process
