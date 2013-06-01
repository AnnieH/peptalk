class MakeCallsController < ApplicationController
  ACCOUNT_SID = 'ACa5f89cfa7f094c1ab6dc0e16aa147144'
  AUTH_TOKEN = '0d4f790b01d308c00896fd15619b5c22'
  
  BASE_URL = "http://localhost:3000/make_call"

  TWILIO_NUMBER = '+15124002709'

  def index
  end

  def make_voice_call
    data = {
      :from => TWILIO_NUMBER,
      :to => '+15126698296',
      #:url => BASE_URL + '/daily.xml',
      :url => 'https://s3.amazonaws.com/uploads.hipchat.com/51066/345673/f6gbbl3bl562q2v/Memo.m4a'
    }

    @twilio_client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    @twilio_client.account.calls.create data
  end

=begin
  def daily
    @post_to = BASE_URL + '/content'
    
    respond_to do |format|
    	format.xml { @post_to }
    end
  end
=end

end
