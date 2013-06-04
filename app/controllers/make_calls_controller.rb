class MakeCallsController < ApplicationController
  ACCOUNT_SID = 'AC1638dc295425dc18a352b6ad09e07bee'
  AUTH_TOKEN = '8d276c1b5958e73e91d934b2e5e6b555'

  TROPO_TOKEN = '2119b2644bd45d49a6f0510e03e73ed8b5330c0fca0ea842ac8f10ebc791da40e5e2409e081f596cb573ff30'
  TROPO_URL = "http://api.tropo.com/1.0/sessions?action=create&token=#{TROPO_TOKEN}&numberToDial=#{params[:phone_number]}"

  def index
  end

  def make_test_call
    current_user.phone_number = params[:phone_number]
    default_append = "+1"
    @twilio_client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    @twilio_client.account.calls.create(
      :from => '+12105260449',
      :to => "#{default_append}#{params[:phone_number]}",
      :url => 'http://localhost/test_call'
      #:url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
      #:url => 'http://s3.amazonaws.com/peptalk-angelhackatx-junk/daily.xml'
    )
    current_user.save!
    redirect_to :root, :notice => "A test call and voice message will be sent to your phone shortly."

    #redirect_to 'home#edit'
  end

  def test_call
    #build a response
    response = Twilio.TwiML:Response.new do |r|
      r.Say 'Hello and welcome to PepTalk dot I O', :voice => 'woman'
      r.Play 'http://peptalk-angelhackatx.s3.amazonaws.com/Memo.mp3'
    end
  end
  
end
