FactoryGirl.define do
  factory :user_datum, :class => 'UserData' do
    uid 1
email "MyText"
nickname "MyText"
std_id 1
group_id 1
admin_group 1
last_update_time 1
last_update_ip 1
  end

end
