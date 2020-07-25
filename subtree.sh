#!/bin/bash

show_usage() {
          echo "Usage: $0 module_name {pull|push}"
          exit 1
}

SUBTREE_BRANCH=master

# subtree item list
case "$2" in
  ibus)
          SUBTREE_DIR=ibus/.config/ibus/rime
          SUBTREE_REPO=git@github.com:noodlefighter/rime-config.git
          ;;
  i3)
          SUBTREE_DIR=i3
          SUBTREE_REPO=git@github.com:noodlefighter/i3wm-config.git
          ;;
  *)
          show_usage
          ;;
esac

# operation
case "$1" in
  add)
          git subtree add --prefix=$SUBTREE_DIR $SUBTREE_REPO $SUBTREE_BRANCH --squash
	  ;;
  pull)
          git subtree pull --prefix=$SUBTREE_DIR $SUBTREE_REPO $SUBTREE_BRANCH --squash
          ;;
  push)
          git subtree push --prefix=$SUBTREE_DIR $SUBTREE_REPO $SUBTREE_BRANCH
          ;;
  *)
          show_usage
esac

exit $?

