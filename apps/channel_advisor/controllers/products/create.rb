require 'dry-validation'

module ChannelAdvisor::Controllers::Products
  class Create
    include ChannelAdvisor::Action

    Schema = Dry::Validation.JSON do
      key(:foo).required(:int?, gt?: 3)
    end

    def call(params)
      result = Schema.call(params.to_h)
      if result.success?
        self.body = { status: 'success' }.to_json
      else
        self.status = 422
        self.body = { errors: result.messages }.to_json
      end
    end
  end
end
