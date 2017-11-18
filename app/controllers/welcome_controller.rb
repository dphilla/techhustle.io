class WelcomeController < ApplicationController

  def index
    @speech = TwilioService.new.get_speech
    render :xml => @speech
  end

end
