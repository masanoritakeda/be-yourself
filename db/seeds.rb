Category.create!([
  {id: 1, name: "海・川"},
  {id: 2, name: "自然"},
  {id: 3, name: "観光"},
  {id: 4, name: "日常"},
  {id: 5, name: "食べ物"},
  {id: 6, name: "景色"},
  {id: 7, name: "イベント"},
  {id: 8, name: "街並み"},
  {id: 9, name: "休日"},
  {id: 10, name: "趣味"},
  {id: 11, name: "運動"},
  {id: 12, name: "その他"}
])
Post.create!([
  {content: "テスト", title: "練習です", image: "something.jpg", place: "江ノ島", user_id: 1}
])
PostCategory.create!([
  {post_id: 1, category_id: 2},
  {post_id: 1, category_id: 3}
])
User.create!([
  {email: "t.masanori0712@icloud.com", password_digest: "$2a$12$MqXqRXckdzlVDUCpLJENV.rtaPcMVh5n2J/dc9mnS6JqHU4MW1GH.", introduce: nil, image: "IMG_2436.JPG", name: "masa takeda"}
])
