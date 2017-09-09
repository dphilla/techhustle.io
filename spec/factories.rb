FactoryGirl.define do
  factory :user do
    username "DanielTest"
    password_digest "xyz"
  end

  factory :connection do
   sequence :name do |n|
     "name #{n}"
   end
    initial_meet "10/10/10"
    organization "a place"
    relationship
  end

  factory :interaction do
    date "10/10/10"
    sequence :location do |n|
      "location #{n}"
    end
    event "mixer"
    decription "so interesting"
    connection
  end

  factory :note do
    content "blah blah"
    date "2017-09-06"
    connection
  end

  factory :relationship do
    status "acquantance"
    action_taken "emailed"
  end

end
