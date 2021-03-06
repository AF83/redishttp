require 'rubygems'
require 'sinatra'
require 'redis'
require 'json'

get '/*' do
  r = Redis.new.send(*params[:splat].first.split('/'))
  resp = r ? r.to_json : '{}'
  resp = "#{params[:callback]}(#{resp});" if params[:callback]
  resp
end
