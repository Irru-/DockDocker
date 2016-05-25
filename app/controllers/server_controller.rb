class ServerController < ApplicationController

  def index
    #@servers = Server.all
    @servers  = JSON.parse(HTTParty.get("http://13.82.59.32:4567/Servers").body)
  end

  def show
  end

  def new
    @server = Server.new
  end

  def create
    url     = "http://13.82.59.32:4567/Add"
    result  = HTTParty.post(url, 
      :body =>  { :name     => params[:server][:name],
                  :ipv4     => params[:server][:ipv4],
                  :ipv6     => params[:server][:ipv6],
                  :location => params[:server][:location]
                  }.to_json)

    logger.debug "----- result = #{result}"

    redirect_to root_path
  end

end
