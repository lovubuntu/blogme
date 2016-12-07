json.extract! blogger_comment, :id, :name, :content, :created_at, :updated_at
json.url blogger_comment_url(blogger_comment, format: :json)