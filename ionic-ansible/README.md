To select **Ubuntu** version change **config.vm.box** in **Vagrantfile**.  

Configuration and variables are available in **provision/group_vars/all.yml**.

To use existing **Ionic** code: copy it to root project directory and specify **{{ app_dir_name }}**,  
if this directory does not exists new **Ionic** project will be created.

To run **Ionic** app login to vagrant instance by executing **vagrant ssh** from host and executing **ionic serve --host=0.0.0.0** from **Ionic** project root.  
Application will be available on host from **localhost:8100**.
