AIDE:
vim /etc/aide.conf:
add file name	changes you want to be alerted with
aide --init
cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
aide --check