require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:alice) {create(:alice)}

  describe 'User CRUD' do
    describe 'before log in' do
      describe 'sign in as new user' do
        context 'sign in form is valid' do
          it "successed with sign in" do
            visit new_user_registration_path
            fill_in 'user[name]', with: 'person#{n}'
            fill_in 'user[birthday]', with: '001996-11-09'
            fill_in 'user[email]', with: 'alice@example.com'
            fill_in 'user[password]', with: 'Password'
            fill_in 'user[password_confirmation]', with: 'Password'
            click_button 'commit'
            #確認する
            expect(current_path).to eq root_path
            expect(page).to have_content "本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。"
            #ようやくできた、ルートとロケールに注意してね
          end
        end
      end
    end
  end
end