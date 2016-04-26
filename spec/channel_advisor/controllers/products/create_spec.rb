require_relative '../../../../apps/channel_advisor/controllers/products/create'

RSpec.describe ChannelAdvisor::Controllers::Products::Create do
  context 'successful' do
    let(:action) { described_class.new }
    let(:params) { {foo: 4} }

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq 200
      expect(JSON.parse(response.last.last)).to be == {"status" => "success"}
    end
  end

  context 'failure' do
    let(:action) { described_class.new }
    let(:params) { {foo: 0} }

    it 'fails w/ message' do
      response = action.call(params)
      expect(response[0]).to eq 422
      expect(JSON.parse(response.last.last)).to be == {"errors" => { "foo" => ["must be greater than 3"] } }
    end
  end

  context 'other' do
    let(:action) { described_class.new }
    let(:params) { {} }

    it 'fails w/ message' do
      response = action.call(params)
      expect(response[0]).to eq 422
      expect(JSON.parse(response.last.last)).to be == {"errors" => { "foo" => ["is missing", "must be greater than 3"] } }
    end
  end
end
