json.extract! page, :id, :title, :body, :locked, :created_at, :updated_at
json.url page_url(page, format: :json)
