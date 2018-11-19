require 'swagger_helper'

describe "Proxies API" do

  path "/proxies" do

    # Test GET
    get "Gets all proxies" do
      tags 'Proxies'
      consumes 'application/json'

      response '200', 'List retrieved' do
        run_test!
      end
    end

    # Test POST
    post "Create a Proxy" do
      tags 'Proxies'
      consumes 'application/json'
      parameter name: :proxy, in: :body, schema: {
          type: :object,
          properties: {
              ip: { type: :string },
              port: { type: :integer }
          },
          required: %w(ip port)
      }

      response '201', 'proxy created' do
        let(:proxy) { { ip: '123.12.3.123', port: 8888} }
        run_test!
      end
    end

    # Test DELETE
    delete "Delete All Proxies" do
      tags 'Proxies'
      consumes 'application/json'

      response '204', 'empty response' do
        run_test!
      end
    end
  end

  path "/proxies/batch" do
    post "Post a list of Proxies" do
      tags 'Proxies'
      consumes 'application/json'
      parameter name: :data, in: :body, schema: {
          type: :object,
          properties: {
              batch: {
                  type: :array,
                  items: {
                      properties: {
                          ip: { type: :string },
                          port: { type: :integer }
                      }
                  }
              }
          }
      }

      response '202', 'accepted batch create' do
        let(:data) {
          {
            batch: [
              {ip: '123.123.123.123', port: 2222},
              {ip: '46.6.456.456', port: 4444}
            ]
          }
        }
        run_test!
      end
    end
  end
end
