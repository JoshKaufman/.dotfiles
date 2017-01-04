#!/bin/bash
#

dockerps () {
  docker ps $(docker ps -a -q -f name="$1")
}

dockerfollow () {
  docker logs -f --tail 500 $(docker ps -a -q -f name="$1")

}
