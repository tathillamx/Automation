#!/bin/bash -e

docker build -qt robot-test-suite-for-b2b-magento:latest ./
docker run --rm -v $(pwd)/tmp:/tests/tmp robot-test-suite-for-b2b-magento:latest --headless $@
