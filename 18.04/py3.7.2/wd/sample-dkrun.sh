docker run -d --restart unless-stopped --name wd -h wd   -e WEBDAV_USERNAME=MYLOGIN  -e WEBDAV_PASSWORD=MyPassw0rd   -v /a/repos:/var/webdav/public   -p 8080:80    	guillaumeai/server:webdavv2
