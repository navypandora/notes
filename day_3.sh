08/06
remote login: ssh [username]@[IP address] command
we can run any command this way on the client computer.

to run a graphical application: export DISPLAY=:[display number]
find the display number using the "w" command.


echo hello hi | wc -w (word count)
	      | wc -c (character count)
	      | wc -l (line count)

echo hello hi how are you | festival --tts (will output text to speech)
ps -aux to find all the processes running
ps -aux | grep firefox find the process which has firefox

triple quotes for continuing lines.
useradd [user] to create a new user, passwd [user] to change the password
userdel [user] to delete a user

sp.getoutput("date") doesn't output the date so it has to be assigned to a variable so we can get the output.

"{} and {} and {}" .format(x,y,x) to assign values or "{0} and {1} and {0}" .format(x,y)

"%name" %s