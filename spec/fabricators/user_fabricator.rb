Fabricator(:user) do
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  username "adam"
  password "foobar"
  password_confirmation "foobar"
  confirmed_at Time.now
end
