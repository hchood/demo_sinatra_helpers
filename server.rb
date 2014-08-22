require 'sinatra'

def read_people_from(filename)
  people = []

  CSV.foreach(filename, headers: true) do |row|
    people << row.to_hash
  end

  people
end

get '/people' do
  @people = read_people_from('people.csv')

  erb :'people/index'
end
