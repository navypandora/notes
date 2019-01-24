find . -type f -name 'cron*' (find in the current directory, type file only-no directories, with the name cron*)
find /home -perm 555 -exec chmod 777 {}  \; (find files with permisions 555 in the /home directory and execute chmod 777 to the found results)
find / -mtime +1(find files in / which were modified in the last 1 day)
find / -a +1 (find files accessed in the last 1 day)
find / -size 1M

set -o noclobber (will prevent overwriting files)

sed 's/parttime/fulltime' team (substitute parttime with fulltime on file team)
sed 's/parttime/fulltime/w promotions' team (send the changed lines to promotions file)
sed '0,/parttime/s/parttime/yeah/' team (1st parttime occurence, substitute parttime with yeah)

ls  | tee file (tee command will show the std output and store it in a file)

grep ^hello testf (return all the lines which begin with hello on file testf)
grep -c ^hello$ (count the number of lines which begin and end with hello)
grep [a-g] testf (return all the characters from a to g)
grep -f filename testf (use pattern from a file)
grep -lr hello . (return files which contains the pattern)
egrep -i 'hello|world' testf (return lines with hello or world)
egrep -vi 'hello|world' testf (return lines which do not contain hello or worlds)
fgrep is used to search for literal texts or words

curl -s google.com | egrep -ci "301 moved" 
(see contents of google.com, count the number of times the "301 moved" line occurs, -i is for ignoring case-sensitive)

curl -s google.com | egrep -ci "301 moved" && echo "true" || echo "false" 
(if previous command succeeds echo "true", if previous command fails echo "false")