NETID1=`neutron net-show net1 | awk '{if (NR == 5) {print $4}}'`
EXTNETID=`neutron net-show ext_net | awk '{if (NR == 5) {print $4}}'`

heat stack-create stack_iis --template-file iis_drupal7_webpi.yaml --parameters="instance_type=m1.sminy;key_name=key1;private_network_id=$NETID1;public_network_id=$EXTNETID;db_password=Passw0rd;drupal_admin=myadmin;drupal_admin_password=Passw0rd;drupal_site_name=My new Drupal site"

