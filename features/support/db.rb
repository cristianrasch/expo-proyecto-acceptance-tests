require 'net/http'

uri = URI('http://qa.lacie-unlam.org/qa/db/reset')

req = Net::HTTP::Post.new(uri.request_uri)
req.basic_auth 'root', 'lacie789'

res = Net::HTTP.start(uri.hostname, uri.port, opt: { read_timeout: 120 }) {|http|
  http.request(req)
}
puts res.body
