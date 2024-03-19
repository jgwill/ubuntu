#!/bin/bash
## --@STCGoal Runs on the VM to start code server and output the password when it starts (and 
sport=8088
if [ -e "/work/_env.sh" ]; then
	. /work/_env.sh
else
	echo "no env exist in /work/_env.sh"
	echo "this might be generating issues or not, you will see"
fi
kada_passwd_file=$(pwd)/.kada-passwd
kada_running_info_file=$(pwd)/.kada-running-info
kada_hostname_channel=$dkhostname:$sport
kada_protocol=http

kada_url="$kada_protocol:://$kada_hostname_channel"
echo "Waiting to get the password....while it starts...."
echo "       see:   cat $(pwd)/.passwd-code-server or  ~/.config/code-server/config.yaml in the vm"
(sleep 10 ; cat ~/.config/code-server/config.yaml | grep passw ; echo "http://127.0.0.1:$sport" > $kada_running_info_file && echo "or : $kada_url " >> $kada_running_info_file  && cat $kada_running_info_file ) &
(sleep 12 ; cat ~/.config/code-server/config.yaml | grep passw > /work/.passwd-code-server ; echo "http://127.0.0.1:$sport") &
if [ -e "/a/repos" ]; then
  echo "Running on /a/repos"
  /usr/bin/code-server /a/repos --host 0.0.0.0 --port $sport
else
 echo "Running on current Dir"
 /usr/bin/code-server /work --host 0.0.0.0 --port $sport
fi
echo "We are Done, goodbye"
sleep 2
#cat ~/.config/code-server/config.yaml | grep passw
#cat ~/.config/code-server/config.yaml | grep passw > /work/.passwd-code-server

