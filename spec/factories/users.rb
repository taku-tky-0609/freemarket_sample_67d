FactoryBot.define do

  factory :user do
    nickname               {"otani_keita"}
    email                  {"keita.otani@gmail.com"}
    last_name              {"圭太"}
    first_name             {"大谷"}
    last_name_kana         {"けいた"}
    first_name_kana        {"おおたに"}
    address                {"東京都"}
    phone_number           {"09012345678"}
    password               {"otani1234"}
    reset_password_token   {}
    reset_password_sent_at {}
    remember_created_at    {}
    self_introduction      {}
    sales                  {}
    point                  {}
    icon                   {}
  end
end