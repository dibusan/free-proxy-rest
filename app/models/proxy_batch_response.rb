class ProxyBatchResponse
  attr_accessor :created_ids, :total_created, :failures
end

class Failure
  attr_accessor :errors, :proxy
end
