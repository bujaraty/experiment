#!/bin/bash
wget --save-cookies cookie.txt --keep-session-cookies http://www.facebook.com/
wget --load-cookies cookie.txt -O ~/development/mh/facebook.html --post-data="charset_test=%E2%82%AC%2C%C2%B4%2C%E2%82%AC%2C%C2%B4%2C%E6%B0%B4%2C%D0%94%2C%D0%84&version=1.0&return_session=0&email=anantira_assawakarn@hotmail.com&pass=bahamoot" https://login.facebook.com/login.php --referer=http://www.facebook.com/

