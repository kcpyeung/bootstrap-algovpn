#!/bin/bash

invoke_remote() {
  ssh $REMOTE 'git clone https://github.com/trailofbits/algo.git'
  ssh $REMOTE 'rm ~/algo/config.cfg'
  scp ./config.cfg $REMOTE:~/algo

  ssh $REMOTE 'cd ~/algo; sudo bash ./install.sh'
}

download_client_info() {
  ssh $REMOTE 'sudo chmod -R 777 /opt/algo/configs/'
  scp -r $REMOTE:/opt/algo/configs/ ./
}

main() {
  invoke_remote
  download_client_info
}

export REMOTE=$1
main
