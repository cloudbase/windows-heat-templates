PUBLIC_NET_ID=`neutron net-show public | awk '{if (NR == 5) {print $4}}'`
PRIVATE_NET_ID=`neutron net-show private | awk '{if (NR == 5) {print $4}}'`
PRIVATE_SUBNET_ID=`neutron net-show private | awk '{if (NR == 13) {print $4}}'`

VOLUME_ID=`cinder show sql-server-fulliso | awk '{if (NR == 10) {print $4}}'`

heat stack-create sql-server-2012-$RANDOM --template-file=sql-server-2012.template --parameters="KeyName=userkey;InstanceType=m1.small;Flavor=m1.medium;PublicNetId=$PUBLIC_NET_ID;PrivateNetId=$PRIVATE_NET_ID;PrivateSubnetId=$PRIVATE_SUBNET_ID;MediaDeviceVolumeId=$VOLUME_ID;MSSQLServicePassword=Passw0rd;MSSQLSaPassword=Passw0rd;ADDomainName=cloudbase1;ADDomainAdminPassword=Passw0rd;ADDomainAdminUsername=Administrator;LocalAdminUsername=localadmin"


