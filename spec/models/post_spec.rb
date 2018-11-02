require "rails_helper"

RSpec.describe Post, :type => :model do
  context "post_model" do
    it { should belong_to(:user) }
    it { should belong_to(:blog) }
    it { should have_many(:comments) }
  end
end