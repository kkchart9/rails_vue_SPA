20.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    publisher: Faker::Book.publisher,
    genre: Faker::Book.genre
  )
end

20.times do
  Blog.create!(
    user_id: 1,
    title: Faker::JapaneseMedia::OnePiece.character,
    body: Faker::JapaneseMedia::OnePiece.quote
  )
end