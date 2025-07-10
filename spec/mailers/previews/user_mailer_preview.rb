# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        UserMailer.with(user: User.first).welcome_email
    end

    def guest_invite
        wedding = Wedding.last || Wedding.create(couple_names: "John and Jane", date: "2023-12-31")
        UserMailer.with(user: User.first, wedding: wedding, guest_emails: ["guest@example.com"]).guest_invite.deliver
    end
end
