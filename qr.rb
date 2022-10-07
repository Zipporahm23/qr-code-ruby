p "hello world!"
require "rqrcode"
user_choice = 1
 while user_choice != 4

  print  "What kind of QR code would you like"
print "\n"*2

p "1. Open a URL"
p "2. Join a wifi network"
p "3. Send a text message"
p "4. Exit program"

user_choice = gets.chomp.to_i
if user_choice == 4
  break

elsif user_choice == 1 #fix
  p "What is the URL: You would like to encode?"

  text_to_encode = gets.chomp

elsif user_choice == 2

  p "What is the name of the wifi network?"

  wifi_input = gets.chomp

  p "What is the password?"

  password_input = gets.chomp


  text_to_encode = " WIFI:T:WPA2;S:#(wifi_input);P:#{password_input};;"

elsif user_choice == 3

  p "What is the phone number you want the code to send a message to?"

  phone_number_input = gets.chomp.to_i

  p "What do you want to populate the message with?"

    message_input = gets.chomp

    text_to_encode = "SMSTO:1#{phone_number_input}:#{message_input}"

  else
    puts "Didn't recognize that selection.Please Try again."

    next

  end
  p "What would you like to call the PNG?"


  png_input = gets.chomp

  qrcode = RQRCode::QRCode.new(text_to_encode)

  png = qrcode.as_png({ :size => 500 })

  IO.binwrite("#{png_input}.png", png.to_s)

end
