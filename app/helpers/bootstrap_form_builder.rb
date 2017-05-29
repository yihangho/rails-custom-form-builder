class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def errors(method)
    object.errors.full_messages_for(method).map { |m| help_block(m) }.join.html_safe
  end

  def help_block(message)
    %Q(<span class="help-block">#{message}</span>).html_safe
  end
end
