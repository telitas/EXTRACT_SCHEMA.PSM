#!/usr/bin/env bats

setup() {
    cd $BATS_TEST_DIRNAME
}

@test "schema.xsd validate all expect schema -> valid" {
    for filepath in `find ./sample/schema/ -name "*.xsd"`
    do
        xmllint --noout --schema ./schema.xsd $filepath
    done
}
