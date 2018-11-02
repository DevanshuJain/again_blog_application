require "rails_helper"

RSpec.describe User, :type => :model do
  context "user_model" do
    it { should have_many(:blogs) }
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end