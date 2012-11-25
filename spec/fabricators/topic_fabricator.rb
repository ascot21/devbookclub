Fabricator(:topic) do
  title "Chapter One"
  body "What did you think of this chapter?"
  book { Fabricate(:book)}
end