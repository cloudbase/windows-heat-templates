NETID1=`neutron net-show net1 | awk '{if (NR == 5) {print $4}}'`

heat stack-create stack2 --template-file ADDC.yaml --parameters="instance_type=m1.sminy;key_name=key1;network_id=$NETID1;domain_name=cloudbase.local;domain_netbios_name=cloudbase;safe_mode_administrator_password=P@ssw0rd"
