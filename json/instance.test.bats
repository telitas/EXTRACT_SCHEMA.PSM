#!/usr/bin/env bats

setup() {
    cd $BATS_TEST_DIRNAME
}

@test "instance.json validate all test data -> valid" {
    for filepath in `find ./sample/data -name "*.json"`
    do
        npx ajv validate -s ./instance.json -d $filepath -c ajv-formats --spec=draft2019
    done
}
