Before do
  Capybara.current_driver = Capybara.javascript_driver = :poltergeist
end

uri = URI.join(TARGET_URI.to_s, '/qa/db/reset')

req = Net::HTTP::Post.new(uri.request_uri)
req.body = ""
req.basic_auth 'root', 'lacie789'

res = Net::HTTP.start(uri.hostname, uri.port, opt: { read_timeout: 120 }) {|http|
  http.request(req)
}
puts res.body
# curl --basic -u "root:lacie789" -d "" http://localhost:3000/qa/db/reset