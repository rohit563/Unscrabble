FactoryGirl.define do
  factory :game do
    f1 "a"
    f2 "s"
    f3 "e"
    f4 "r"
    f5 "c"
    f6 "t"
    f7 "o"
    f8 "a"
    f9 "j"
    f10 "r"
    f11 "a"
    f12 "e"
    f13 "t"
    f14 "p"
    f15 "l"
    f16 "l"
    gameName "gamename"
    user_id 0
  end
   factory :invalidGame do
    f1 "a"
    f2 "s"
    f3 "e"
    f4 "r"
    f5 "c"
    f6 "t"
    f7 "o"
    f8 "a"
    f9 "j"
    f10 "r"
    f11 "a"
    f12 "e"
    f13 "t"
    f14 "p"
    f15 "l"
    gameName "gamename"
    user_id 0
  end
  
  
  factory :user do
    email 'afoajawgonn@asf2r.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
  
  
  factory :InvalidUser do
    email ""
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end