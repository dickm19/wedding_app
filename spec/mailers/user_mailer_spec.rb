require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) { User.create(email: "test@example.com") }
    let(:mail) { UserMailer.with(user: user).welcome_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to NearlyWed!")
      expect(mail.to).to eq([ user.email ])
      expect(mail.from).to eq([ "nearlywed1@gmail.com" ])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("You have successfully signed up for NearlyWed")
      expect(mail.body.encoded).to match("Thanks for joining and have a great day!")
    end
  end

  describe "guest_invite" do
    let(:wedding) { Wedding.create(couple_names: "John and Jane", date: "2023-12-31") }
    let(:guest_emails) { [ "guest1@example.com", "guest2@example.com" ] }
    let(:mail) { UserMailer.with(wedding: wedding, guest_emails: guest_emails).guest_invite }

    it "renders the headers" do
      expect(mail.subject).to eq("Save the Date for December 31, 2023!")
      expect(mail.to).to eq(guest_emails)
      expect(mail.from).to eq([ "nearlywed1@gmail.com" ])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("You've been Invited to John and Jane's wedding on December 31, 2023")
    end
  end
end
