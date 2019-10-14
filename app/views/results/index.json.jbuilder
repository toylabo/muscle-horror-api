json.set! :responceCode, @response_code
json.set! :message, @message
json.set! :total, @results.size
json.set! :currentPage, @page

json.set! :result do |json|
  json.array!(@results) do |result|
    json.extract! result, :id, :name, :score
  end
end