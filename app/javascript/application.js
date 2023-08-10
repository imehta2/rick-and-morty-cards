// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'jquery';
import Turbolinks from 'turbolinks';
const stripe = Stripe('pk_test_51NdRbxFktg0CjVwYfy15P3pYZanFGMinl4R7xtKZnaPvGskTIqYXKZTR1KnuNgv7e6DNDzxHDJSsq8VMejK9u6Jn00rx5EcpFO');
const elements = stripe.elements();
