class SupportController < ApplicationController

  def new
  end

  def create
    from_email = params[:email]
    message = params[:message]

    @errors = []
    @errors << 'Error: Please enter an e-mail address' if from_email.blank?
    @errors << 'Error: Please enter a message to send' if message.blank?

    if @errors.empty?
      SupportMailer.contact_support(from_email, message).deliver_now
      render :success
    else
      render :new
    end
  end

end
