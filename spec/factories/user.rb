FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '太郎' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
