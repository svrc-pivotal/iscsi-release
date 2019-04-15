#!/bin/bash

# Login to BOSH by grabbing the Ops Man BOSH Command-line credentials from BOSH Director Tile -> Credentials Tab -> Bosh Commandline Credentials

#Example
# BOSH_CLIENT=ops_manager 
# BOSH_CLIENT_SECRET=EKcXhxp50TaKjsSEI-HP 
# BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate 
# BOSH_ENVIRONMENT=10.0.0.10

# Uncomment/edit below to use the GUID of your PKS cluster
# export BOSH_DEPLOYMENT=service-instance_<guid>

bosh -n manifest > /tmp/pks-manifest-$BOSH_DEPLOYMENT
bosh -n deploy /tmp/pks-manifest-$BOSH_DEPLOYMENT -o csi-feature-gate.yml
