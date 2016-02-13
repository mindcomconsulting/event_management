json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :feedback, :date, :email
  json.url feedback_url(feedback, format: :json)
end
