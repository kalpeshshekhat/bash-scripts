 2423  tar xvzf nexus-3.13.0-01-unix.tar.gz -C /opt
 2438  cd /etc/systemd/system
 2443  vim nexus.service
 2444  systemctl daemon-reload
 2445  systemctl enable nexus.service
 2452  chown -R nexus:nexus nexus-3.13.0-01
 2453  chown -R nexus:nexus sonatype-work
 2455  systemctl start nexus.service
 2456  tail -f /opt/sonatype-work/nexus3/log/nexus.log

