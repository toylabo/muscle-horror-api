url = "https://muscle-horror-festival.netlify.com/result/#{@result.id.to_s}"
json.set! :responceCode, @response_code
json.set! :message, @message
json.set! :url, url
json.set! :qr, "https://chart.apis.google.com/chart?cht=qr&chs=300x300&choe=utf8&chl=#{url}"
