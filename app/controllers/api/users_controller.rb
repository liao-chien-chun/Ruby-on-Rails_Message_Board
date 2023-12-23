class Api::UsersController < ApplicationController
  # 解決 CSRF 問題
  protect_from_forgery with: :null_session

  # 註冊函式
  def register
    # 註冊邏輯
    # 取得參數
    user_params = params.permit(:account, :pwd, :birthday, :age, :email, :checkPwd)

    # 驗證
    unless valid_regitration?(user_params)
      render json: { error: '密碼與確認密碼不符' }, status: :unprocessable_entity
      return
    end

    # 對密碼進行雜湊
    encrypted_pwd = encrypt_password(user_params[:pwd])
    # 新增 user 實體
    @user = User.new(user_params.except(:pwd, :checkPwd).merge(pwd: encrypted_pwd))

    # 成功
    if @user.save
      render json: { user: @user.as_json(except: :pwd), message: '註冊成功' }, status: :created
    else
      render json: { error: @user.error.full_messages }, status: :unprocessable_entity
    end
  end


  # 私有
  private

  # 檢查密碼是否一致
  def valid_regitration?(params)
    params[:pwd] == params[:checkPwd]
  end

  # 雜湊密碼
  def encrypt_password(password)
    BCrypt::Password.create(password)
  end
end
