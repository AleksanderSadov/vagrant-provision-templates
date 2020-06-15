To select **Ubuntu** version change **config.vm.box** in **Vagrantfile**.  

Configuration and variables are available in **provision/group_vars/all.yml**.

To use existing **Angular** code: copy it to root project directory and specify **{{ app_dir_name }}**,  
if this directory does not exists new **Angular** project will be created.

To run **Angular** app login to vagrant instance by executing **vagrant ssh** from host and executing **ng serve --host=0.0.0.0 --poll=2000** from **Angular** project root.  
Application will be available on host from **localhost:4200**.
