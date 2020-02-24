#!/bin/bash

invoke_remote() {
  ssh $REMOTE 'git clone https://github.com/kcpyeung/bootstrap-algovpn'
  ssh $REMOTE 'cd ~/bootstrap-algovpn; sudo bash ./install.sh'
}

download_client_info() {
  ssh $REMOTE 'sudo chmod -R 777 /opt/algo/configs/localhost/wireguard'
  scp -r $REMOTE:/opt/algo/configs/localhost/wireguard ./
}

main() {
  invoke_remote
  download_client_info
}

export REMOTE=$1
main
