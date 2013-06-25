require 'sinatra/base'
require "sqlite3"
require_relative 'lib/concerns/persistable'
require_relative 'lib/models/student'

# set :database, "sqlite3:///student_rack.db"

# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    get '/' do
      "hello world!"
    end

    get '/index' do
      @students = Student.all
      erb :students
    end

    @students = Student.all
    @students.each do |student|
      student_id = student.id
      get "/#{student_id}" do
        erb ":#{student_id}"
      end
    end
  end
end