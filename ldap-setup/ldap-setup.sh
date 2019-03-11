#!/bin/bash

yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
systemctl start slapd
systemctl enable slapd

PSWD=`slappasswd -h {SSHA} -s ldppassword`

cat >> $SCRIPT_HOME/db.ldif <<'EOF'
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=lrn,dc=io

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=ldapadm,dc=lrn,dc=io

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: replaceit 
EOF

sed -i "s/replaceit/${PSWD}/" $SCRIPT_HOME/db.ldif

ldapmodify -Y EXTERNAL -H ldapi:/// -f db.ldif

ldapmodify -Y EXTERNAL -H ldapi:/// -f monitor.ldif

cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG

chown ldap:ldap /var/lib/ldap/*

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f base.ldif

ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f user1.ldif
ldappasswd -s user1 -W -D "cn=ldapadm,dc=lrn,dc=io" -x "uid=user1,ou=People,dc=lrn,dc=io"
ldapsearch -x cn=user1 -b dc=lrn,dc=io

yum install -y openldap-clients nss-pam-ldapd
systemctl restart  nslcd

ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f group1.ldif

ldapmodify -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f addtogroup.ldif

ldapsearch -x -W -D "cn=ldapadm,dc=lrn,dc=io" -b "uid=user1,ou=People,dc=lrn,dc=io" "(objectclass=*)"
ldapsearch -x -W -D "cn=ldapadm,dc=lrn,dc=io" -b "uid=group1,ou=Group,dc=lrn,dc=io" "(objectclass=*)"

ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f user2.ldif
ldapmodify -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f addtogroup.ldif
ldapsearch -x -W -D "cn=ldapadm,dc=lrn,dc=io" -b "uid=group1,ou=Group,dc=lrn,dc=io" "(objectclass=*)"
ldapsearch -x -W -D "cn=ldapadm,dc=lrn,dc=io" -b "uid=user2,ou=People,dc=lrn,dc=io" "(objectclass=*)"
ldapsearch -LLL -x -b "dc=lrn,dc=io" gidNumber=101
ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f user3.ldif
ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f user4.ldif
ldapadd -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f user5.ldif
ldapsearch -LLL -x -b "dc=lrn,dc=io" gidNumber=101
ldapmodify -x -W -D "cn=ldapadm,dc=lrn,dc=io" -f addtogroup.ldif
ldapsearch -LLL -x -b "dc=lrn,dc=io" gidNumber=101
ldapsearch -LLL -x -b "dc=lrn,dc=io" gidNumber=101
ldappasswd -s password123 -W -D "cn=ldapadm,dc=lrn,dc=io" -x "uid=user2,ou=People,dc=lrn,dc=io"
ldappasswd -s password123 -W -D "cn=ldapadm,dc=lrn,dc=io" -x "uid=user3,ou=People,dc=lrn,dc=io"
ldappasswd -s password123 -W -D "cn=ldapadm,dc=lrn,dc=io" -x "uid=user4,ou=People,dc=lrn,dc=io"
ldappasswd -s password123 -W -D "cn=ldapadm,dc=lrn,dc=io" -x "uid=user5,ou=People,dc=lrn,dc=io"
