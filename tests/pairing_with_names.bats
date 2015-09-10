#!/usr/bin/env bats
#
# Successfull pairing commands

CWD=$(pwd)
PATH=$CWD:$PATH

load assertions
load git_environment

@test "Pairing with a user name" {
    run git-pair "John Doe"

    assert_success
    assert_equals "Local authors name now are: Git Pair User + John Doe" "$output"
}

@test "Pairing with two other user names" {
    run git-pair "John Doe"
    run git-pair "Jane Doe"

    assert_success
    assert_equals "Local authors name now are: Git Pair User + John Doe + Jane Doe" "$output"
}

@test "Ending a pairing session with 'ended'" {
    run git-pair "John Doe"
    run git-pair ended

    assert_success
    assert_equals "Local author name now is: Git Pair User" "$output"
}

@test "Ending a pairing session with 'finished'" {
    run git-pair "John Doe"
    run git-pair finished

    assert_success
    assert_equals "Local author name now is: Git Pair User" "$output"
}

@test "Ending a pairing session which did not begin" {
    run git-pair ended

    assert_success
    assert_equals "Local author name now is: Git Pair User" "$output"
}
