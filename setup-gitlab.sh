 2920  yum install curl policycoreutils-python openssh-server
 2921  yum install postfix -y
 2922  systemctl start postfix
 2923  systemctl enable postfix
 2924  systemctl status postfix
 2925  curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh|bash
 2926  EXTERNAL_URL="http://cmb.lrn.io" yum install -y gitlab-ee
 2927  EXTERNAL_URL="http://cmb.lrn.io" yum install -y gitlab-ce
 2928  systemctl status gitlab
 2929  service httpd stop
 2930  systemctl disable httpd

