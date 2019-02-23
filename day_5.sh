running a python file from another system
CGI - Common Gateway Interface
store the files in /var/www/cgi-bin
add #!/usr/bin/python36 in the header of the file
add print("content-type: text/html \n") in the header
make the file executable by using chmod
setenforce 0
iptables -F 

type http://[ip address]/cgi-bin/file.py on the browser


HTML, HTML form
<input type = "file">
<select><option></option></select>

sending python commands and output to a page

