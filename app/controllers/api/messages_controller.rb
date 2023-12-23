module Api
  class Api::MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
    protect_from_forgery with: :null_session

    # index 列出所有留言
    def index
      @messages = Message.all
      render json: @messages
    end 

    # show 列出單個留言
    def show
      render json: @message
    end

    # create 建立留言
    def create
      @message = Message.new(message_params)

      if @message.save
        render json: @message, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end

    # update 更新留言
    def update
      if @message.update(message_params)
        # 更新成功，設定 updated_time 為現在時間
        @message.update(updated_time: Time.current)
        render json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end

    # destroy 刪除留言
    def destroy
      @message.destroy
      head :no_content
    end

    private
    # 抓取資料
    def set_message
      @message = Message.find(params[:id])
    end
    # 取得參數
    def message_params
      params.permit(:title, :content)
    end

  end
end
