module RVM

  def start_message
    puts "Enter the Operating system you are using(eg:1):-\n"
    puts "1)Ubuntu Linux\n"
    puts "2)Mac OSX\n"
    puts "3)Centos or Redhat Linux"
    puts "4)Windows"
  end

  def linux_message
    system "sudo yum install curl"
    system "sudo curl -L get.rvm.io | bash -s stable"
    system "source /usr/local/rvm/rvm.sh"
    system "sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel"
    puts "Which version of ruby you want to install eg: 2.0.0-p0"
  end

  def ubuntu_message
    puts "here"
    system "sudo apt-get install build-essential git-core"
    system "sudo apt-get install curl"
    system "bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)"
    puts "Please enter your username of the ubuntu"
  end

  def windows_message
    system "bundle install"
    system "mkdir pik_bin"
    system "pik_install c:/pik_bin && cd c:/pik_bin"
    system "pik install ruby"
  end

  def mac_os_selection
    puts "Please select which version of ruby you want to install:"
    puts "1)ruby 1.8.7\n"
    puts "2)ruby 1.9.3\n"
    puts "3)ruby 2.0.0\n"
    v = gets.chomp
    if v.to_i == 1
      system "CC=/opt/local/bin/gcc-apple-4.2 rvm install ruby-1.8.7-p370 --enable-shared --without-tk --without-tcl"
    elsif v.to_i == 2
      system "CC=/opt/local/bin/gcc-apple-4.2 rvm install ruby-1.9.3-p194 --enable-shared --without-tk --without-tcl"
    else
      system "CC=/opt/local/bin/gcc-apple-4.2 rvm install ruby-2.0.0-p0 --enable-shared --without-tk --without-tcl"
    end
  end
   
  class << self
    include RVM
    def install
      start_message
      system = gets.chomp
      puts system
      case system.to_i
       
      when 3
        linux_message
        s = gets.chomp
        begin
          system "rvm install #{s}"
        rescue
          system "rvm install 2.0.0"
        end
      when 1
        ubuntu_message
        username = gets.chomp
        str = <<-EOR
           echo '[[ -s "/home/#{username}/.rvm/scripts/rvm" ]] && source "/home/#{username}/.rvm/scripts/rvm"' >> ~/.bashrc
        EOR
        system "#{str}"
        system "source ~/.bashrc"
        system "type rvm | head -1"
        puts "Which version of ruby you want to install eg: 2.0.0-p0"
        ver = gets.chomp
        system "rvm install #{ver.to_s}"
        system "rvm list"
      when  2
        begin
          system "sudo port selfupdate"
          system "sudo port install apple-gcc42"
        rescue
          system "brew update && brew tap homebrew/dupes && brew install apple-gcc42"
        end
        mac_os_selection
      when 4
        windows_message
      end
      system "sudo rvm pkg install openssl"
    end
  end
end