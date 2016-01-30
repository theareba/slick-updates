FactoryGirl.define do
  factory :user do
    email "vicgoburg@gmail.com"
    uid "116650942799756855718"
  end

  factory :update_form do
    name "form name"
    token "13123jnn3113"
    user_id "1"
  end

  factory :question do
    text "some text"
    position "1"
    update_form_id "1"
  end
end
