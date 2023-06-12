# previews

Notes on the [build-preview.sh](https://github.com/ousleyp/previews/blob/main/build-preview.sh) script:

- Read the comments before using. :)
- It won't work if you don't run it from the `openshift-docs` directory.
- Don't save it to the `openshift-docs` directory, though! You can save it to your `previews` dir
  or another directory that belongs to you alone.
- The script assumes that `openshift-docs` and `previews` have the same parent directory;
  in my case, they're in a directory called `repos`:

        $ ls ~/repos
        openshift-docs previews

If you move your openshift-docs directory, you might have to change the search path in VSCode.
To avoid this potential headache, don't move it; just make sure you create your `previews` repo dir
in the same parent directory as `openshift-docs`.

TIP: it can be useful to create an alias or two to make the script more convenient.
For example:

    alias preview="~/repos/previews/build-preview.sh"
    alias preview-okd="~/repos/previews/build-preview.sh okd"

You can add the aliases to a hidden config file, such as `~/.bashrc` or `~/.zshrc`.
This way, they will persist so you can just run `preview` or `preview-okd` whenever.

After editing the shell config file, restart the shell. You can do this by opening a new
terminal window or by running `zsh`/`bash` or the equivalent for your shell.

If you don't know what shell you're using, run `$ echo $SHELL`.

If you have a bunch of terminals open, run the `zsh`/`bash` equivalent in all
of them or they won't have the latest changes to the `rc` file.

Authored by: Pan Ousley, 6/2023
