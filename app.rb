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
      template = ERB.new(File.read("views/profile.erb"))
      # debugger
      f = File.new("views/#{student.id}.erb", "w")
      File.open(f, "w") do |file|
        file.write(template)
      end
    end

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
      get "/#{student_id}" do
        erb ":#{student_id}"
      end
    end
  end
end