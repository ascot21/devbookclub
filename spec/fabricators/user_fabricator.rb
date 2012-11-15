Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  username "eliza"
  password "password"
  password_confirmation "password"
  confirmed_at Time.now
end
