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

    get '/' do
      "hello world!"
    end

    get '/index' do
      @students = Student.all
      erb :students
    end
    
    #creates routes for ERB profiles
    get "/students/:int" do
      Student.find(params[:int])
      student_info = Student.find(params[:int])
      @name = student_info[1]

      puts "student_info is #{student_info}"

      puts "NAME = #{@name}"        

      erb :profile
    end
  end
end