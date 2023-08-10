Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51NdRbxFktg0CjVwYfy15P3pYZanFGMinl4R7xtKZnaPvGskTIqYXKZTR1KnuNgv7e6DNDzxHDJSsq8VMejK9u6Jn00rx5EcpFO'],
  secret_key: ENV['sk_test_51NdRbxFktg0CjVwY3B3Ivlf0w3RmJibCuuXuRJG8IxuUHhJD1ywExOqIRjBgmtjdTaXJ262XHRGfs3jWWUH0T04E00nFkSeCZy']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


