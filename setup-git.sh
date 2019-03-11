#!/bin/bash

 2904  git-shell
 2905  ls -l /bin/git-shell
 2906  vim /etc/shells
 2907  chsh git -s $(which git-shell)
 2908  su - git
 2909  vim /etc/shells
 2910  chsh git -s $(which git-shell)
 2911  ls -l /usr/bin/git-shell
 2912  vim /etc/shells
 2913  su - git
 2914  vim /etc/shells
 2915  which bash
 2916  chsh git -s $(which bash)
 2917  su - git

