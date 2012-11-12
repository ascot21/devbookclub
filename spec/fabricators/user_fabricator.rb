Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  user "eliza"
  password "password"
  password_confirmation "password"
end
