module ApplicationHelper

  def bootstrap_class_for flash_type
    {success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info'}[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: "close", id: 'flash-close', data: { dismiss: 'alert' })
      concat message
      end)
    end
    nil
  end

  def profile_page?
    params[:controller] == 'users' && params[:id] == current_user.id.to_s
  end

  def new_task_page?
    params[:action] == 'new' && params[:controller] == 'tasks'
  end

end
