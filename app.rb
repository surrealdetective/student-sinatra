require 'sinatra/base'
require "sqlite3"
require_relative 'lib/concerns/persistable'
require_relative 'lib/models/student'
# require "debugger"

# set :database, "sqlite3:///student_rack.db"

# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    #@students variable defined for class
    @students = Student.all
    
    #creates ERB profiles
    @students.each do |student|


    get '/' do
      "hello world!"
    end

    get '/index' do
      @students = Student.all
      erb :students
    end

    #creates routes for ERB profiles
    @students.each do |student|
      student_id = student.id
      get "/students/#{student_id}" do
        erb :profile
      end
    end
  end
end