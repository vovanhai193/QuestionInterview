require 'rails_helper'

RSpec.describe Api::EventLogsController, type: :controller do
  describe 'Post #create' do
    context 'Do not pass parameters' do
      it 'should not create event log' do
        post :create
        result = JSON.parse(response.body)
        expect(result['status']).to eq "bad_request"
      end
    end

    context 'Pass parameters' do
      it 'should create event log' do
        post :create, params: {event_name: "test", timestamp: "2017-10-01 06:00:01"}, as: :json
        result = JSON.parse(response.body)
        expect(result['status']).to eq "ok"
      end
    end
  end
end
