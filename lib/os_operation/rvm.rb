module RVM
  class << self
    def install
      puts "Enter the Operating system you are using(eg:1):-\n"
      puts "1)Ubuntu Linux\n"
      puts "2)Mac OSX\n"
      puts "3)Centos or Redhat Linux"
      puts "4)Windows"
      system = gets
      case system
      when system.to_i == 3
        #          system "sudo apt-get install build-essential git-core"
        system "sudo yum install curl"
        system "sudo curl -L get.rvm.io | bash -s stable"
        system "source /usr/local/rvm/rvm.sh"
        system "sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel"
          
        puts "Which version of ruby you want to install eg: 2.0.0-p0"
        s = gets
        begin
          system "rvm install #{s}"
        rescue
          system "rvm install 2.0.0"
        end
      when system.to_i == 1
        system "sudo apt-get install build-essential git-core"
        system "sudo apt-get install curl"
        system "bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)"
        puts "Please enter your username of the ubuntu"
        username = gets
        str = <<-EOR
           echo '[[ -s "/home/#{username}/.rvm/scripts/rvm" ]] && source "/home/#{username}/.rvm/scripts/rvm"' >> ~/.bashrc
        EOR
        system "#{str}"
        system "source ~/.bashrc"
        system "type rvm | head -1"
        puts "Which version of ruby you want to install eg: 2.0.0-p0"
        ver = gets
        system "rvm install #{ver.to_s}"
        system "rvm list"
      when system.to_i == 2
        begin
          system "sudo port selfupdate"
          system "sudo port install apple-gcc42"
        rescue
          system "brew update && brew tap homebrew/dupes && brew install apple-gcc42"
        end
        puts "Please select which version of ruby you want to install:"
        puts "1)ruby 1.8.7\n"
        puts "2)ruby 1.9.3\n"
        puts "3)ruby 2.0.0\n"
        v = gets
        if v.to_i == 1
          system "CC=/opt/local/bin/gcc-apple-4.2 rvm install ruby-1.8.7-p370 --enable-shared --without-tk --without-tcl"
        elsif v.to_i == 2
          system "CC=/opt/local/bin/gcc-apple-4.2 rvm install ruby-1.9.3-p194 --enable-shared --without-tk --without-tcl"
        else
          system "CC=/opt/local/bin/gcc-apple-4.2 rvm install ruby-2.0.0-p0 --enable-shared --without-tk --without-tcl"
        end
      end
      system "sudo rvm pkg install openssl"
    end
  end
end