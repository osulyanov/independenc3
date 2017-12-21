json.courses @courses do |course|
  json.Id course.id
  json.Name course.name
  json.Author course.author
  json.Categories course.category_id
  json.State course.state
end
