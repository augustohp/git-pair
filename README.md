# git-pair

Simple bash-script allowing pair to be identified on git commits:

    $ git pair "Nelson Senna"

From now own, your commits will be identified with authors like:

    commit a101286e02117fdafea58742074694138d578948
    Author: Augusto Pascutti + Nelson Senna <augusto@phpsp.org.br>
    Date:   Thu Sep 3 23:00:58 2015 -0300

You can use as many pairs you want, all you need is keep issuing
commands to add more authors.

    git pair ended

At the end of your pairing session, the above command will reset
author names to your global `user.name` configuration on Git.

## Instalation

You can clone the project where you want to, all you need after
is to sym-link the `git-pair` script to your `$PATH`:

    $ cd <my-src-dir>
    $ git clone http://github.com/augustohp/git-pair
    $ chmod a+x git-pait/git-pair
    $ ln -s <my-src-dir>/git-pair /usr/local/bin

Now you should be able to execute `git pair` anywhere.
