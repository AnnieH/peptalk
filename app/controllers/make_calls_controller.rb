class MakeCallsController < ApplicationController
  ACCOUNT_SID = 'ACa5f89cfa7f094c1ab6dc0e16aa147144'
  AUTH_TOKEN = '0d4f790b01d308c00896fd15619b5c22'

  def index
  end

  def make_voice_call
    @twilio_client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    @twilio_client.account.calls.create(
      :from => '+15124002709',
      #:to => '+15126698296',
      :to => params[:phone_number],
      :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
      #:url => 'http://s3.amazonaws.com/peptalk-angelhackatx-junk/daily.xml'
    )
    
    redirect_to 'home#edit'

  end
  
end
