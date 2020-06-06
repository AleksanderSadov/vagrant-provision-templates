## Vagrant template provisions to use for new projects

To select **Ubuntu** version change **config.vm.box** in **Vagrantfile**.  

Configuration available in **provision/group_vars/all.yml**.

Tested packages versions compatibility with default **phpmyadmin** package listed below.  

#### 1. Ubuntu 20.04 (generic/ubuntu1604)
* Apache 2.4
* Mysql 8.0
* Php 7.4+

#### 2. Ubuntu 18.04 (generic/ubuntu1804)
* Apache 2.4
* Mysql 5.7
* Php 5.6 - Php 7.0+

#### 3. Ubuntu 16.04 (generic/ubuntu1604)
* Apache 2.4
* Mysql 5.7
* Php 5.6+