require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'pry'

def read_people_from(filename)
  people = []

  CSV.foreach(filename, headers: true) do |row|
    people << row.to_hash
  end

  people
end

helpers do
  def full_name(person)
    "#{person['First Name']} #{person['Last Name']}"
  end

  def full_names(people)
    names = []

    people.each do |person|
      names << full_name(person)
    end

    names
  end
end

get '/people' do
  @people = read_people_from('people.csv')

  erb :'people/index'
end
