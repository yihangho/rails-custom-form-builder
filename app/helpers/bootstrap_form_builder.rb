class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def errors(method)
    object.errors.full_messages_for(method).map { |m| help_block(m) }.join.html_safe
  end

  def help_block(message)
    %Q(<span class="help-block">#{message}</span>).html_safe
  end

  def label(method, text = nil, options = {}, &block)
    super(method, text, insert_class("control-label", options), &block)
  end

  private

  def insert_class(class_name, options)
    output = options.dup
    output[:class] = ((output[:class] || "") + " #{class_name}").strip
    output
  end
end
