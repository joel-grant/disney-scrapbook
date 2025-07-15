module ApplicationHelper
  def auth_button_classes(variant = :primary)
    base_classes = "text-sm/6 font-semibold text-white px-4 py-2 rounded-md transition-colors"
    case variant
    when :primary
      "#{base_classes} bg-gray-800 hover:bg-gray-700"
    when :danger
      "#{base_classes} bg-red-600 hover:bg-red-700"
    when :secondary
      "#{base_classes} bg-gray-600 hover:bg-gray-500"
    end
  end

  def mobile_auth_button_classes(variant = :primary)
    base_classes = "-mx-3 block rounded-lg px-3 py-2.5 text-base/7 font-semibold text-white transition-colors"
    case variant
    when :primary
      "#{base_classes} hover:bg-gray-800"
    when :danger
      "#{base_classes} hover:bg-red-800"
    when :secondary
      "#{base_classes} hover:bg-gray-700"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def flash_notification_classes(type)
    base_classes = "relative"
    case type.to_s
    when "notice"
      "#{base_classes} bg-gradient-to-r from-green-600/90 to-emerald-600/90"
    when "alert", "error"
      "#{base_classes} bg-gradient-to-r from-red-600/90 to-rose-600/90"
    when "warning"
      "#{base_classes} bg-gradient-to-r from-yellow-600/90 to-amber-600/90"
    else
      "#{base_classes} bg-gradient-to-r from-blue-600/90 to-indigo-600/90"
    end
  end

  def flash_icon(type)
    case type.to_s
    when "notice"
      # Magic wand / success icon
      content_tag :svg, class: "h-6 w-6 text-white", fill: "none", viewBox: "0 0 24 24", stroke: "currentColor" do
        content_tag :path, "", "stroke-linecap": "round", "stroke-linejoin": "round", "stroke-width": "2", d: "M5 13l4 4L19 7"
      end
    when "alert", "error"
      # Warning icon
      content_tag :svg, class: "h-6 w-6 text-white", fill: "none", viewBox: "0 0 24 24", stroke: "currentColor" do
        content_tag :path, "", "stroke-linecap": "round", "stroke-linejoin": "round", "stroke-width": "2", d: "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.732 15c-.77.833.192 2.5 1.732 2.5z"
      end
    when "warning"
      # Info icon
      content_tag :svg, class: "h-6 w-6 text-white", fill: "none", viewBox: "0 0 24 24", stroke: "currentColor" do
        content_tag :path, "", "stroke-linecap": "round", "stroke-linejoin": "round", "stroke-width": "2", d: "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
      end
    else
      # Star / magic icon for default
      content_tag :svg, class: "h-6 w-6 text-white", fill: "currentColor", viewBox: "0 0 20 20" do
        content_tag :path, "", d: "M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"
      end
    end
  end
end
