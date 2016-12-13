class ServiceButtonDecorator < Draper::Decorator

  delegate :icon

  def label
    render(object.label)
  end

  def href
    render(object.href)
  end

  def icon_class
    if object.icon.present?
      "fa fa-#{object.icon}"
    end
  end

  private

  def render(source)
    handlebars = Handlebars::Context.new
    handlebars.register_helper(:encodeURIComponent) do |_, context, _|
      CGI::escape_element(context || '')
    end
    handlebars.register_helper(:encodeURI) do |_, context, _|
      CGI::escape(context || '')
    end
    handlebars.register_helper(:customField) do |issue, context, _|
      @field_names ||= issue.names.to_h.invert

      if @field_names[context].present?
        issue.fields.send(@field_names[context]) || ''
      else
        ''
      end
    end
    handlebars.register_helper(:helperMissing) do |_, context, _|
      ""
    end
    template = handlebars.compile(source)
    template.call(context[:issue])
  end
end
