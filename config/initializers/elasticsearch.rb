require 'elasticsearch'
Elasticsearch::Client.new(
  host: 'localhost',
  port: 9200,
  transport_options: {
    request: { timeout: 5 }
  }
)