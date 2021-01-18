require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    visit root_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    visit new_user_session_path
    # サインインページへ遷移
    expect(current_path).to eq new_user_session_path
    # 遷移出来ていることを確認
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on('Log in')
    # 保存されているユーザー情報を入力しクリック
    expect(current_path).to eq root_path
    # トップページへ遷移
  end

  it 'ログインに失敗し、再度サインインページに戻る' do
    visit new_user_session_path
    # サインインページへ遷移
    expect(current_path).to eq new_user_session_path
    # 遷移出来ていることを確認
    fill_in 'user_email', with: 'abc123@gmail.com'
    fill_in 'user_password', with: '1234aaa'
    click_on('Log in')
    # 誤ったユーザー情報を入力しクリック
    expect(current_path).to eq new_user_session_path
    # サインインページに戻っていることを確認
  end
end
