# How to use

1. Copy the `values.sample.sh` file into `values.sh`.
1. Edit the copied file to your values.
1. Generate the authority. In case you have already one, go to the next section.
1. Copy the `mygen.sample.sh` file into `mygen.sh`, edit it.
1. Run ./mygen.sh.
1. Wait, see, enjoy!

# Import an authority

Each generated certificate is in the PEM format and in two files :

 * One for the key, named "foo.ca.key"
 * Another for the certificate, named "foo.ca.crt"

Then, you know what you have to do :)

# Override settings with shell environment

Just use the shell: exporting variables used by the "values.sh" script will just make them the default for the rest of your shell's life.
