class SupportController < ApplicationController

  def new
  end

  def create
    from_email = params[:email]
    message = params[:message]

    @errors = []
    @errors << 'YAINT, DAT EMAIL EMPTY' if from_email.blank?
    @errors << 'SAY WHAT AGAIN' if message.blank?

    if @errors.empty?
      SupportMailer.contact_support(from_email, message).deliver_now
      render :success
    else
      render :new
    end
  end

end
