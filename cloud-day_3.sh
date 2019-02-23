EC2: Elastic Cloud Compute 
EC2 provides Storage, RAM, CPU, Network Card, Boot Image(AMI) to Run an OS
ENI(Elastic Network Interface): to insert a network card on the virtual OS
EBS: provides storage to the virtual OS

Launch this instance: Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-40142d25(Docker pre-installed)
Step 3: select a subnet from the list
		Go down to Network Interfaces and you can add one more network card by clicking the Add Device Button

When we launch an OS, amazon will set a firewall on it, which means no one can access it, to make an exception allow a particular port number or an IP address
We'll' be setting up a web server on the instance

Step 6: Add rule, Select HTTP from the list
Launch instance

The status check takes time, amazon check the OS before providing us the OS, that everything is working properly.
Now since we have attached 2 network cards, amazon doesn't' know for which card to provide Public IP for, so we don't' have a Public IP.
we have 2 options, delete a VM and create a VM with only 1 Network Card.

Or get an EIP (Elastic IP): go to Elastic IPs on the left menu, Allocate New Address.(but this is paid because this gives us a Static IP)
CLick on Actions, Click Associate Address, Associate it with the particular Interface you want to, and your instance will get the Public IP(Static)
Static Public IPs are paid. 