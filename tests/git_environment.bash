# Git environment
#
# Backups user configuration on setup and recover them
# on tear down.
# Author: Augusto Pascutti <augusto@phpsp.org.br>
# vim: ft=sh noexpandtab ts=4 sw=4:

ORIGINAL_GIT=$(which git)
HOME=$BATS_TMPDIR
REPOSITORY_DIR="$BATS_TMPDIR/git-pair-test-repo"

# Providing global git configuration on fake user home dir
cp $BATS_TEST_DIRNAME/gitconfig $HOME/.gitconfig

function setup
{
    mkdir $REPOSITORY_DIR
    cd $REPOSITORY_DIR
    git init
}

function teardown
{
    rm -rf $REPOSITORY_DIR
}

