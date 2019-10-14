json.set! :responceCode, @response_code
json.set! :message, @message
json.set! :result do |json|
  json.extract!(@result, :name, :score, :life)
  json.set! :analysis do |json|
    json.extract!(@result, :muscle, :speed, :affinity, :exploratory)
  end
end