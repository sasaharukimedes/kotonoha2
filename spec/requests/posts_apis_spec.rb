require 'rails_helper'

RSpec.describe "PostsApis", type: :request do
  before(:each) do
    5.times do |user|
      @user = create(:user)
    end
    @receiver = User.where.not(id:@user.id).order(:received_at).first
  end

  #https://qiita.com/nakachan1994/items/f62cd4d93c061e3fa6df参考
  let!(:new_post) { create(:post, user_id: @user.id , sender_id: @user.id, receiver_id: @receiver.id) }

  #let!(:post) {create(:post, user_id: other_user.id , sender_id: other_user.id, receiver:user, receiver_id: other_user.id)}

  #describe "GET /posts_apis" do
    #it "works! (now write some real specs)" do
      #get posts_apis_path
      #expect(response).to have_http_status(200)
    #end
  #end

  #ポストの作成
  describe "GET /new" do
    it "returns http success" do
      sign_in @user
      get new_post_path
      expect(response).to have_http_status(:success)
      p Post.all
    end
  end

  describe "POST / create" do
    it "returns http success" do
      sign_in @user
      post "/posts", :params => {:post => {
        :user_id =>  @user.id ,
        :sender_id => @user.id,
        :receiver_id => @receiver.id
      }}
      p Post.all
      expect(response).to have_http_status(:success)
    end
  end

end

