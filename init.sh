#!/bin/bash
#
export DISPLAY=:0.0
set +e
#
docker exec -it dockeramazonaskcli_nodejs_1 ask init --no-browser
