require 'rails_helper'

RSpec.describe "PostsApis", type: :request do
  #let!(:user) { create(:user) }
  #let!(:other_user) { create(:user) }
  #let!(:alice) {create(:alice)}

  before(:each) do
    5.times do |user|
      @user = create(:user)
    end
    #@user = create(:user)
    #@other_user = create(:other_user)
    #@alice=create(:alice)
    #@receiver = @other_user
  end

  #https://qiita.com/nakachan1994/items/f62cd4d93c061e3fa6df参考
  let!(:post) {create(:post, user_id: @user.id , sender_id: @user.id, receiver: @user, receiver_id: @user.id)}
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
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end


  #ポストの作成ののち、received_atが更新されているのか確認

end
