openssl req -newkey rsa:2048 -sha256 -nodes -keyout private.key -x509 -days 365 -out public_cert.pem -subj "/C=RU/ST=State/L=Location/O=Organization/CN=ServerHost"

openssl pkcs12 -export -in public_cert.pem -inkey private.key -certfile public_cert.pem -out keystore.p12
keytool -importkeystore -srckeystore keystore.p12 -srcstoretype pkcs12 -sigalg SHA1withRSA -destkeystore keystore.jks -deststoretype JKS

rm keystore.p12
rm private.key

#После запуска скрипта, на выходе получаем два файла: keystore.jks — используется на сервере, public_cert.pem — используется при установке webhook в Android приложении.
