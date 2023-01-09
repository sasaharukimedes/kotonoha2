FactoryBot.define do
  factory :post do
    # userモデルアソシエーション
    association :user

    dear { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 10) }
    from { Faker::Lorem.characters(number: 10) }

    #association :other_user
  end
end