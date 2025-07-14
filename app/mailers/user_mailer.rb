class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url = "http://localhost:3000"
        mail(to: @user.email, subject: "Welcome to NearlyWed!")
    end

    def guest_invite
        @user = params[:user]
        @wedding = params[:wedding]
        @recipient_emails = params[:guest_emails]
        @url = "http://localhost:3000/guest_signup"
        mail(to: @recipient_emails, subject: "Save the Date for #{@wedding.date.strftime("%B %d, %Y")}!")
    end
end
