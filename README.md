# iscsi-release
ISCSI and CSI 1.0 BOSH addon for use with Cloud Foundry Container Runtime (CFCR) and Enterprise PKS

Version 1.6 - Introduce CSI images for use with K8s worker nodes, XtremIO CSI plugin
Version 1.5 - Xenial stemcells only; also makes the root filesystem rshared

1. Installs multipath tools and open-iscsi and dependents  Currently doesn't configure the ISCSI initiator, relies on default random initiator name.

1. Optionally pre-loads CSI 1.0 docker images on Kubernetes nodes for airgapped environments

1. Optionally installs the DellEMC XtremIO CSI plugin as a CSI driver

Note:  This addon dpkg installs the standard debian packages which launches the iSCSI initiator as an Ubuntu service. 
This should be fine if your bosh jobs that use iSCSI volumes do all their mounting/targeting after the pre-start phase.

