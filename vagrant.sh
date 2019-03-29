vagrant box add hashicorp/precise64
Open the Vagrantfile and change the contents to the following:

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
end


The "hashicorp/precise64" in this case must match the name you used to add the box above.
This is how Vagrant knows what box to use. If the box was not added before,
Vagrant will automatically download and add the box when it is run.

You may specify an explicit version of a box by specifying config.vm.box_version for example:


Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_version = "1.1.0"
end


vagrant up
vagrant ssh