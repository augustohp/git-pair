# Assertions to be used wit BATS
#
# Makes tests read more like xUnit tests.
# Author: Augusto Pascutti <augusto@phpsp.org.br>
# vim: ft=sh noexpandtab ts=4 sw=4:

function log
{
    echo $* >&2
}

function fail {
    log $*
    return 1
}

function assert_equals {
    local expected=$1
    local given=$2
    local given_message=$3
    local default_message="Expected strings to be equal."
    local message=${given_message:=$default_message}

    if [ ! -z "$output" ]; then
        log "Output: $output"
    fi
    if [ "$given" != "$expected" ]; then
        log "Expected: $1"
        log "Result: $2"
        fail "$message"
    fi
}

function assert_not_equals {
    local expected=$1
    local given=$2
    local given_message=$3
    local default_message="Expected strings to be different."
    local message=${given_message:=$default_message}

    if [ ! -z "$output" ]; then
        log "Output: $output"
    fi
    if [ "$given" == "$expected" ]; then
        log "Result: $2"
        fail "$message"
    fi
}

function assert_failure {
    assert_not_equals 0 $status "Command should fail execution."
}

function assert_success {
    assert_equals 0 $status "Command should have successfull execution."
}
