# previews

Notes on the [build-preview.sh](https://github.com/ousleyp/previews/blob/main/build-preview.sh) script:

- Read the comments before using :)
- It won't work if you don't run it from the openshift-docs directory
- The script assumes that openshift-docs and previews have the same parent
  in my case, they're in a directory called `repos`:
  
    $ ls ~/repos
  
    openshift-docs previews

TIP: it can be useful to create an alias or two to make this even faster.
This is what mine look like:

    alias preview="~/repos/previews/build-preview.sh"
    alias preview-okd="~/repos/previews/build-preview.sh okd"

You can add the aliases to a hidden config file, such as `~/.bashrc` or `~/.zshrc`.
This way, they will persist so you can just run `preview` or `preview-okd` whenever.

After editing the shell config file, restart the shell. You can do this by opening a new
terminal window or by running `zsh`/`bash` or the equivalent for your shell.

If you don't know what shell you're using, run `$ echo $SHELL`.

If you have a bunch of terminals open, run the `zsh`/`bash` equivalent in all
of them or they won't have the latest changes to the `rc` file.
