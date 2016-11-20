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
    template = handlebars.compile(source)
    template.call(context[:issue])
  end
end