require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'rack/csrf'

 # CSRF 対策
use Rack::Session::Cookie, secret: "thisissomethingsecret"
use Rack::Csrf, raise: true

# ヘルパーの利用
helpers do
  def csrf_tag
    Rack::Csrf.csrf_tag(env)
  end
  def csrf_token
    Rack::Csrf.csrf_token(env)
  end
  def h(str)
    Rack::Utils.escape_html(str)
  end
end

# アクティブレコードの準備
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './bbs.db'
)

class Comment < ActiveRecord::Base
  validates :body, presence: true
end

get '/' do
  @title = "My BBS"
  @comments = Comment.all
  erb :index
end

post '/create' do
  Comment.create(body: params[:body])
  redirect to ('/')
end

post '/destroy' do
  Comment.find(params[:id]).destroy
end
get '/about' do
  @title = "About"
  erb :about
end
