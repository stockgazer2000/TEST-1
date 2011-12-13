# To change this template, choose Tools | Templates
# and open the template in the editor.

Factory.define :user do |user|
  user.sequence(:email) { |n| "user#{n}@ticketee.com" }
  user.password "password"
  user.password_confirmation "password"
end
