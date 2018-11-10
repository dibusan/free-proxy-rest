class ProxiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Proxy.all
  end

  def create_batch
    batch_response = ProxyBatchResponse.new

    proxy_batch_params[:batch].each do |proxy_params|
      proxy = Proxy.new(proxy_params)
      if proxy.save
        batch_response.add_success(proxy)
      else
        batch_response.add_failure(proxy)
      end
    end

    render json: batch_response
  end

  def create
    @proxy = Proxy.new(proxy_params)
    if @proxy.save
      render json: @proxy, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def purge
    Proxy.destroy_all
    head :no_content
  end

  private
    def proxy_params
      params.require(:proxy).permit(:ip, :port, :code, :country, :anonymity, :google, :https, :last_checked)
    end

    def proxy_batch_params
      params.permit(batch: [:ip, :port])
    end
end
