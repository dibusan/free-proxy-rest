class ProxiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Proxy.all
  end

  def create_batch
    @response = ProxyBatchResponse.new
    @response.total_created = 0
    @response.created_ids = []
    @response.failures = []

    # TODO: Can this be turned into a private batch_proxy_params function (like proxy_params) ?
    params["batch"].each do |p|
      newP = Proxy.new(p.permit(:ip, :port))
      if newP.save
        @response.total_created += 1
        @response.created_ids.push(newP.id)
      else
        failure = Failure.new
        failure.errors = newP.errors
        failure.proxy = newP
        @response.failures.push(failure)
      end
    end

    render json: @response, status: :accepted
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
end
