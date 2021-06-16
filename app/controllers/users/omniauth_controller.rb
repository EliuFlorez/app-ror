class Users::OmniauthController < ApplicationController
  # define callback all
  def callbackOAuth(type)
    @user = case type
      when "Facebook"
        User.create_from_provider_data(request.env['omniauth.auth'])
      when "Github"
        User.create_from_github_data(request.env['omniauth.auth'])
      when "Google"
        User.create_from_google_data(request.env['omniauth.auth'])
      when "Twitter"
        User.create_from_twitter_data(request.env['omniauth.auth'])
      else
        flash[:error] = "There was a problem signing you in through #{type}. Please register or try signing in later."
        redirect_to new_user_registration_url
    end

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: type) if is_navigational_format?
    else
      flash[:error] = "There was a problem signing you in through #{type}. Please register or try signing in later."
      redirect_to new_user_registration_url
    end 
  end
  
  # facebook callback
  def facebook
    callbackOAuth("Facebook") 
  end

  # github callback
  def github
    callbackOAuth("Github")
  end

  # google callback
  def google_oauth2
    callbackOAuth("Google")
  end

  # twitter callback
  def twitter
    callbackOAuth("Twitter")
  end

  # failed callback
  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
end
