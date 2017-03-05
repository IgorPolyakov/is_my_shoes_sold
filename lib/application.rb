require 'sinatra'
require 'nokogiri'
require 'open-uri'

# class AddressBook < Sinatra::Base
#     @page = Nokogiri::HTML(open('https://trial-sport.ru/goods/1209102.html'))
#     @price = @page.at_css('.price')
#     get '/' do
#         erb :index
#     end
# end

# @price = @page.at_css('.price')
get '/' do
    @page = Nokogiri::HTML(open('https://trial-sport.ru/goods/1209102.html'))
    @price = @page.css('.price').last.text
    @description = @page.css('#ai1_sub > div:nth-child(2) > div:nth-child(1)').text
    @label = @page.css('.card_right > h2:nth-child(1)').text
    erb :index
end

get '/search' do
    erb :search
end

post '/result' do
    p params
    @fname = params[:fname]
    @lname = params[:lname]
    erb :result
end
