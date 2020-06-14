To select **Ubuntu** version change **config.vm.box** in **Vagrantfile**.  

Configuration and variables are available in **provision/group_vars/all.yml**.

To use existing **Angular** code: copy it to root project directory and specify **{{ app_dir_name }}**,  
if this directory does not exist latest **Angular** will be downloaded for new projects.
