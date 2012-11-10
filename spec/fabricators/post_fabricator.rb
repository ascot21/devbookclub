Fabricator(:book) do
  title "Great Book!"
  body "Really, this is."
  buy_link "www.example.com"
  author { Fabricate(:user) }
end