#!/usr/bin/env bats

setup() {
    cd $BATS_TEST_DIRNAME
}

@test "instance.xsd validate all test data -> valid" {
    for filepath in `find ./sample/data -name "*.xml"`
    do
        xmllint --noout --schema ./instance.xsd $filepath
    done
}
