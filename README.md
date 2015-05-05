# aes-wipe
This script wipes HDDs using OpenSSL. It takes advantage of the AES-NI feature which makes wiping a lot faster than conventional programs (e.g. [Darik's Boot and Nuke](http://dban.org))

### Usage

Simply run the script and append the device name:

    $ ./aes-wipe.sh /dev/sda
    
#####Disclaimer
I am not responsible for any data loss or damage caused by this script. Use it at your own risk.