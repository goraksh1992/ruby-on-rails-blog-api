json.message "User details"
json.users @users.each do |user|
    json.id user.id
    json.full_name user.full_name
    json.email user.email

end