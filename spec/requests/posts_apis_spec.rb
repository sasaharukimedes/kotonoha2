require 'rails_helper'

RSpec.describe "PostsApis", type: :request do

  before(:each) do
    4.times do |user|
      @user = create(:user)
    end
    @receiver = User.where.not(id:@user.id).order(:received_at).first
  end

  #https://qiita.com/nakachan1994/items/f62cd4d93c061e3fa6df参考
  #let!(:new_post) { create(:post, user_id: @user.id , sender_id: @user.id, receiver_id: @receiver.id) }
  #let!(:post) { create(:post, user_id: @user.id , sender_id: @user.id, receiver_id: @receiver.id) }
  #let!(:posts) { create_list(:post, 2, user_id: @user.id , sender_id: @user.id, receiver_id: @receiver.id) }


  #ポストの作成
  #describe "GET /new" do
    #it "returns http success" do
      #sign_in @user
      #post = create(:post, user_id: @user.id , sender_id: @user.id, receiver_id: @receiver.id)
      #get new_post_path
      #expect(response).to have_http_status(:success)
      #p Post.all
    #end
  #end

  describe "POST / create" do
    it "returns http success" do
      sign_in @user
      post "/posts", :params => {:post => {
        :dear => "dear dear" ,
        :content => "content content",
        :from => "from from"
      }}
      p Post.all
      expect(response).to have_http_status(:success)
    end
  end


end

