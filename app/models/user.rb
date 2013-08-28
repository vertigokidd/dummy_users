class User < ActiveRecord::Base


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    begin   
      if password == user.password
        return user
      else
        return nil
      end
    rescue
      return nil
    end
  end

end



