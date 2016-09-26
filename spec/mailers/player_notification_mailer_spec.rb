require "rails_helper"

RSpec.describe PlayerNotificationMailer, type: :mailer do
  describe "order_failed" do
    let(:mail) { PlayerNotificationMailer.player_called_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Order failed")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
