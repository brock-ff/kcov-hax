# kcov-hax

Just run the kcov script.

```shell
./kcov
```

You can modify which binary gets analyzed in `./kcov`. Just change the `BIN_PATH` variable:

```shell
BIN_PATH="/ilp/interledger-rs/target/debug/ilp-node"
# could be
BIN_PATH="/ilp/interledger-rs/target/debug/ilp-cli"
```

You'll have to modify the Dockerfile or come up with a better way to import binaries. You need to build the binaries on a _Debian_ machine.
