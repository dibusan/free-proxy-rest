class ProxyBatchResponse
  attr_reader :created_ids, :total_created, :failures

  def initialize
    @total_created = 0
    @created_ids = []
    @failures = []
  end

  def add_success(proxy)
    @total_created += 1
    @created_ids << proxy.id
  end

  def add_failure(proxy)
    @failures << Failure.new(proxy.errors, proxy)
  end

  class Failure
    attr_reader :errors, :proxy

    def initialize(errors, proxy)
      @errors = errors
      @proxy = proxy
    end
  end
end

