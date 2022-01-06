require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "reset_password_email" do
    let(:mail) { UserMailer.reset_password_email }
  end
end
