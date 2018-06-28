# iscsi-release
ISCSI terminator packages BOSH addon

Version 1.0

Installs multipath tools and open-iscsi for Ubuntu trusty.  Currently doesn't configure the ISCSI initiator.

Note:  This addon dpkg installs the standard debian packages which launches the iSCSI terminator as an Ubuntu service. 
This should be fine if BOSH your bosh jobs that use iSCSI volumes do all their mounting/targeting after the pre-start phase.

