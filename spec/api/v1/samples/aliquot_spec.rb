require 'rails_helper'

RSpec.describe "samples#aliquot", type: :request do
  let!(:sample) { create(:sample) }

  subject(:make_request) do
    jsonapi_put "/api/v1/samples/#{sample.id}/aliquot", payload
  end

  let(:payload) do
    {
      data: {
        id: sample.id.to_s,
        type: 'samples',
        attributes: {
          number: 2
        }
      }
    }
  end

  it "creates 2 samples from the given sample" do
    expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Sample.all.count }.to eq(3)
  end

  it "returns the orginal and two additional samples" do
    make_request
    expect(d.map(&:jsonapi_type).uniq).to match_array(['samples'])
    expect(d.map(&:id)).to match_array([*Sample.order(:label).pluck(:id)])
  end
end
