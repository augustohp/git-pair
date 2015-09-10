#!/usr/bin/env bats
#
# Miserable attempts to do pair programming

CWD=$(pwd)
PATH=$CWD:$PATH

load assertions
load git_environment

# @TODO A better error message should be nice on those situations
@test "Starting a pairing session when not inside a git repository" {
    cd $BATS_TMPDIR

    run git-pair "John Doe"

    assert_failure
    #assert_equals "Your not inside a git repository to start pairing" "$output"
}

# @TODO Should fail with a "nice" error message
@test "Starting a pair without a global user name configured" {
    git config --global user.name ""

    run git-pair "John Doe"

    assert_success
    assert_equals "Local authors name now are: + John Doe" "$output"
}

# @TODO A better error message should be nice on those situations
@test "When git is not installed" {
    PATH=$CWD:/bin:/usr/bin

    run git-pair

    assert_failure
    #assert_equals "Git is not installed, moron!" "$output"
}
