require 'rails_helper'

RSpec.describe "PostsApis", type: :request do
  let(:current_user){ create :user }

  before do
    create_list :user, 3
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
    it "means that received_at is updated successfully" do
      sign_in current_user
      receiver1 = User.where.not(id: current_user.id).order(:received_at).first
      post "/posts", :params => {:post => {
        :dear => "dear dear" ,
        :content => "content content",
        :from => "from from"
      }}
      post1 = Post.last
      expect(post1.receiver_id).to eq receiver1.id

      receiver2 = User.where.not(id: current_user.id).order(:received_at).first
      expect(receiver1.id).not_to eq receiver2.id
      post "/posts", :params => {:post => {
        :dear => "dear2 dear2" ,
        :content => "content2 content2",
        :from => "from2 from2"
      }}
      post2 = Post.last
      expect(post2.receiver_id).to eq receiver2.id
    end
  end
end

