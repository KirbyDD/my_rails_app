class Error
  def error_message(user)
    if user.errors.messages[:email].length > 0
      "Account not created. Email already taken."
    elsif user.errors.messages[:password_confirmation].length > 0
      "Account not created. Password and confirmation do not match."
    end
  end

  def bad_credentials
    "Username and/or password is incorrect."
  end
end
