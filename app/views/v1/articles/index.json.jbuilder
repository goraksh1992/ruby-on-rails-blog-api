json.articles @articles.each do |article|
    json.id article.id
    json.title article.title
    json.body article.body

    json.user article.user.as_json(only: [:id, :full_name])
end