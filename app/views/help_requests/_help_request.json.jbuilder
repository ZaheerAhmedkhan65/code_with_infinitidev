json.extract! help_request, :id, :title, :message, :user_id, :created_at, :updated_at
json.url help_request_url(help_request, format: :json)
