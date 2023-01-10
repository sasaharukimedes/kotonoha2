FactoryBot.define do

  factory :alice, class: User do
    id {100}
    name  {"alice"}
    email {"alice@example.com"}
    password { "Password" }
    password_confirmation {"Password" }
    birthday {'001996-11-09'}
    received_at {Time.current}
    #received_atも試しにコンソールでやったらちゃんと出来てた！！
    #メール認証用
    confirmed_at {Date.today}
  end

  factory :user do
    sequence(:name) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    birthday {"001990-01-01"}
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:received_at) {|n| "2023, 01, 0#{n}"}
    confirmed_at {Date.today}
  end

  factory :other_user, class: User do
    sequence(:name) { |n| "other_person#{n}" }
    sequence(:email) { |n| "other_person#{n}@example.com" }
    birthday {"001990-01-01"}
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:received_at) {|n| "2021, 01, 0#{n}"}
    confirmed_at {Date.today}
  end
end