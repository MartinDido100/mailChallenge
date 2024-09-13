class Api::EmailController < ApplicationController
    before_action :authenticateUser

    def initialize
      @service = EmailService.new
    end

    def sendMail
      if !@loggedUser.confirmed
        render json: {error: 'You must confirm your email'}, status: :conflict 
      end

      begin
        @email = @service.createMail(sendEmailParams,@loggedUser)
        UserMailer.sendMail(@email).deliver_later
        render json: {msg: 'Mail sent sucessfully!'}, status: :ok
      rescue ActiveRecord::RecordInvalid => e
        render json: {error: e.message}, status: :unprocessable_entity
      end
    end

    def stats
      puts @loggedUser.role.user?
      if @loggedUser.role.user?
        render json: {error: 'You must be admin to see this content'}, status: :forbidden
      end

      @stats = @service.getStats
      @serializer = UserSerializer.new(@stats)

      render json: @serializer.as_json, status: :ok
    end

    private
    
    def sendEmailParams
      params.permit(:subject,:receiverId,:body)
    end
end
