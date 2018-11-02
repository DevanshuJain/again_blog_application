require "rails_helper"

RSpec.describe BlogsController, :type => :controller do
  it "assigns blog" do
    user = FactoryBot.create(:user)
    
    user.skip_confirmation! 
    sign_in user

    # user.skip_confirmation!
    get :index
    byebug
    expect(response.status).to eq(302)
  end
end
