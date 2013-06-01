xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do
    xml.Play "https://s3.amazonaws.com/peptalk-angelhackatx/girdley.mp3"
  end
end
