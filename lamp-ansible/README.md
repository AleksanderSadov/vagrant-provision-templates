To select **Ubuntu** version change **config.vm.box** in **Vagrantfile**.  

Configuration available in **provision/group_vars/all.yml**.

Virtual Hosts templates available in  **provision/roles/apache2/files**.

Tested packages versions compatibility listed below.  

#### 1. Ubuntu 20.04 (generic/ubuntu1604)
* Apache 2.4
* MySQL 8.0
* PHP 7.4
* phpMyAdmin 4.9.5
* xdebug 2.9.5

#### 2. Ubuntu 18.04 (generic/ubuntu1804)
* Apache 2.4
* MySQL 5.7
* PHP 5.6, PHP 7.0
* phpMyAdmin 4.6.6
* xdebug 2.8.1

#### 3. Ubuntu 16.04 (generic/ubuntu1604)
* Apache 2.4
* MySQL 5.7
* PHP 5.6
* phpMyAdmin 4.5.4
* xdebug 2.5.5
