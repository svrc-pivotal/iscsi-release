#!/bin/bash

# Login to BOSH by grabbing the Ops Man BOSH Command-line credentials from BOSH Director Tile -> Credentials Tab -> Bosh Commandline Credentials

CURRENT_DIR=$(dirname "$(readlink -f "$0")")

#Example
# BOSH_CLIENT=ops_manager 
# BOSH_CLIENT_SECRET=EKcXhxp50TaKjsSEI-HP 
# BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate 
# BOSH_ENVIRONMENT=10.0.0.10

# Uncomment/edit below to use the GUID of your PKS cluster
# export BOSH_DEPLOYMENT=service-instance_<guid>

# Ensure the iSCSI release tarball is uploaded to Ops Manager,  this script assumes the filename is iscsi-1.6.tgz
# Upload the iSCSI release tarball to the BOSH director
bosh upload-release $CURRENT_DIR/iscsi-1.6.tgz

# Apply the iSCSI addon
bosh -n update-config --name=iscsi-addon --type=runtime $CURRENT_DIR/iscsi-manifest.yml

# Apply the CSI images and Xtremio addon
bosh -n update-config --name=csi-xtremio --type=runtime $CURRENT_DIR/csi-xtremio-addon.yml

# Apply the Feature Flags patch - this needs to be rerun after each upgrade errand run with PKS
bosh -n manifest > /tmp/pks-manifest-$BOSH_DEPLOYMENT
bosh -n deploy /tmp/pks-manifest-$BOSH_DEPLOYMENT -o $CURRENT_DIR/csi-feature-gate.yml

# Ensure your kubectl context is properly set to your desired cluster prior to running this CRD installer for CsiNodeInfo
kubectl apply -f $CURRENT_DIR/csinodeinfo.yml

