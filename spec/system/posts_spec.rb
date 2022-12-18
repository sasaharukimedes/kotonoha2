require 'rails_helper'

RSpec.describe Post, type: :system do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:user_3) { create(:user) }
  let(:user_4) { create(:user) }

  describe 'ポスト作成の流れ' do
    describe 'ポスト作成のため正しいidを取ってくる' do
    end

    describe 'ポスト作成の後、受信ユーザーのreceived_atを更新する' do

    end

  end

end