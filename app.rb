require "sinatra"
require "./lib/counter"
require './database_connection_setup'

class CounterApp < Sinatra::Base

  before do
    @counter = Counter.instance
    p '@counter:', @counter
  end

  get '/' do
    erb :index
  end

  post '/increment' do
    p '@counter_increment', @counter.increment
    redirect '/'
  end

  post '/decrement' do
    p '@counter_decrement', @counter.decrement
    redirect '/'
  end

end
