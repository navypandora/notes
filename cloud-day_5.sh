Multiple Datacenters (1a, 1b, 1c....) in the Same city for disaster recovery
Many Datacenters across the countries.

If i want to choose the particular Datacenters  I want to launch my instance: Step 3, subnet.
The aws is highly dependent on the region you are working on, the securty groups and private key you had for one region won't' work for an instance in any other region.
The new EBS should be in the same Availability zone as the instance.

in the amazon image, we cannot login by root using ssh, to change that: 
edit /etc/ssh/sshd_config and uncomment "PermitRootLogin yes"
change PasswordAuthentication "no" to "yes"
set root password


connect EBS to your laptop: make the instance an iSCSI server