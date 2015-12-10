require 'sinatra'
require 'httparty'
require 'json'

post '/gateway' do
  action = params[:text].gsub(params[:trigger_word], '').strip

  repo_url = "https://api.github.com/repos/jonBarcus/SoIaF_GM_Tools"

  case action
    when 'issues'
      resp = HTTParty.get(repo_url)
      resp = JSON.parse resp.body
      respond_message "There are #{resp['open_issues_count']} open issues on SoIaF_GM_Tools"
  end
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end
