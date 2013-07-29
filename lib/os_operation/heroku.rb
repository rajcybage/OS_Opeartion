module Heroku
  class Login	
    def self.authentication
      begin
        Gem::Specification.find_by_name "heroku"
        system "heroku login"
      rescue Gem::LoadError 
        system "bundle install" 
        system "heroku login"
      ensure
        system "gem list heroku"	
      end 	
    end
  end

  class CreateApp
    def self.create_heroku_app
      puts "Write your Application Name and then Enter"
      s = gets	
      system "heroku apps:create #{s.strip!}"
    end 
  end

  class RenameApp
    def self.rename_heroku_app
      puts "Rename without checkout puts Y/N"
      s = gets
      if s.downcase.strip! == "y"
        puts "Enter the new Name:"
        newname = gets
        puts "Enter the old Name:"
        oldname = gets
        unless newname.downcase != oldname.downcase
          system "heroku apps:rename #{newname} --app #{oldname}"
          system "git remote rm heroku"
          system "heroku git:remote -a #{newname}"
        else
          puts "Old Name and New name should not be same"  
        end 
      end
    end  	
  end

  class LogoutApp
    def self.logout
      system "heroku logout"
      puts "Logout from your heroku account"
    end
  end	
end