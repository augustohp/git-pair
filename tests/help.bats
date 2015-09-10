#!/usr/bin/env bats
#
# Help and usage messages test suite

CWD=$(pwd)
PATH=$CWD:$PATH

load assertions

@test "Command without arguments gives failed status code" {
    run git-pair

    assert_failure
}

@test "Command without arguments displays help" {
    run git-pair
    how_many_lines=$(echo "$output" | wc -l)

    assert_equals 11 $how_many_lines
}
