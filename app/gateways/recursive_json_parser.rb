class RecursiveJsonParser < HTTParty::Parser

  protected

  def json
    RecursiveOpenStruct.new(super)
  end

end