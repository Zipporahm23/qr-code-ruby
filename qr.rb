p "hello world!"
require "rqcode"


qrcode=RQRCode::QRCode.new("www.cnn.com")

png = qrcode.as_png({ :size => 500})

10.binwrite("sometext.png", png.to_s)
