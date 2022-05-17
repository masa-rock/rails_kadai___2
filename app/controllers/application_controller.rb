class ApplicationController < ActionController::Base
  
  # deviseコントローラにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 編集画面から画像を受け取れるよう設定する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar,:name,:profile])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
  
end
