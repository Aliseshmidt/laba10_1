require 'rails_helper'

RSpec.describe "Task101s", type: :request do
  describe "GET /task101" do
    it "returns http success" do
      get task101_input_path
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get task101_output_path
      expect(response).to have_http_status(:success)
    end

    it "returns correct result" do
      get '/task101/output.x?digit=3&route=client&commit=Enter'
      expect(body.include?('/browser_render.xslt')).to be true
    end

    it "returns correct result" do
      get '/task101/output.x?digit=3&route=server&commit=Enter'
      expect(body.include?('/server.xslt')).not_to be true
    end

    it "returns correct results" do
      get '/task101/output.x?digit=3&route=server&commit=Enter'
      response_first = @response.body
      get '/task101/output.x?digit=3&route=cient&commit=Enter'
      response_second = @response.body
      expect(response_first).not_to be eq(response_second)
    end

    it "returns correct result" do
      get '/task101/output.x?digit=3&route=server&commit=Enter'
      html_doc = Nokogiri::HTML(response.body)
      expect([153, 370, 371, 407]).to eq(html_doc.css('table').css('tr')[1..].map do |row|
                                                    row.css('td')[1].text.to_f
                                                  end)
    end
  end
end
