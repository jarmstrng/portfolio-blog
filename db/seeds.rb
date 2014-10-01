bob = User.create(email: "bob@dbc.com", password: "123")

article_1 = Article.create(title: "Hello World", content: "<p>This is an article on my blog! Yay articles!</p>")

smarm = Comment.create(content: "Hey I'm writing a jerky comment bc this is the internet lololol", user: bob, article: article_1)