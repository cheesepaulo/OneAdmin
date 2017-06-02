FactoryGirl.define do
  factory :printer do
    name FFaker::Lorem.word
    kind { rand(0..1) }
    ip_address FFaker::Internet::ip_v4_address
    status { rand(0..1) }
    department
  end
end
