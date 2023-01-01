# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# class for calc
class Task101Controller < ApplicationController
  def input; end

  def output
    @val = params[:digit]
    @side = params[:route]
    my_url = "http://localhost:3000/task10/output?format=xml&digit=#{@val}"
    api_response = URI.open(my_url)

    case @side
    when 'server'
      @digits = xslt_transform(api_response).to_html
    when 'client'
      render xml: insert_browser_xslt(api_response).to_xml
    end
  end

  private

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/app/helpers/server.xslt"))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet',
                                                    'type="text/xsl" href="/browser_render.xslt"')
    puts data
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
