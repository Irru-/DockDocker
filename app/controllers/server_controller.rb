class ServerController < ApplicationController

  def index
    if params[:job]
      ContainerJob.enqueue("QUEUE_NAME", params, params[:job])
      redirect_to root_path
    end
    #@servers = Server.all
    begin
      @servers  = JSON.parse(HTTParty.get("http://13.82.59.32:4567/5650e4ac-21a5-11e6-97ff-000c29c38991/Servers").body)
    rescue
      @servers  = Server.all
    end
  end

  def show
    if params[:job]
      ContainerJob.enqueue(params[:job], params)
      redirect_to :back
    end
    @containers = JSON.parse(HTTParty.get("https://ef30000a.ngrok.io/DockDocker-Agent/api/containers").body)
  end

  def new
    @server = Server.new
  end

  def create
    url     = "http://13.82.59.32:4567/5eb967ea-21a5-11e6-8c36-000c29c38991/Add"
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
