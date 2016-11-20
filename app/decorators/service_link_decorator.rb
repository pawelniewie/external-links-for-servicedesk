class ServiceLinkDecorator < Draper::Decorator

  delegate :color

  def label
    render(object.label)
  end

  def href
    render(object.href)
  end

  private

  def render(source)
    handlebars = Handlebars::Context.new
    handlebars.register_helper(:encodeURIComponent) do |_, context, _|
      CGI::escape_element(context)
    end
    handlebars.register_helper(:encodeURI) do |_, context, _|
      CGI::escape(context)
    end
    template = handlebars.compile(source)
    template.call(context[:issue])
  end
end