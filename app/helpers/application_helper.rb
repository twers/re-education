module ApplicationHelper

  def current_user
    Publisher.find session[:user_id] unless session[:user_id].nil?
  end
  
  def online?
    current_user.present?
  end

  def super_manager?
    current_user && current_user.super_manager?
  end

  def feature_on?
    true
  end

  def colorful_icon_class_from_index idx
    colorful_icons = ["pink", "green", "blue", "orange"]
    colorful_text = ["&#127891;", "&#128640;", "&#128240;", "&#128101;", ""]
    idx = idx % colorful_icons.length
    { :class_name => colorful_icons[idx], :icon_text => colorful_text[idx] }
  end

  def description_editor form
    form.kindeditor :content,
      :items => ['source', 'formatblock', 'bold', 'italic', 'underline', 'link', '|', 'indent', 'outdent', '|', 'insertorderedlist', 'insertunorderedlist', 'image', 'fullscreen'],
      :cols => 60, 
      :rows => 5
  end
end
