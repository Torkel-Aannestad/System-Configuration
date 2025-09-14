# SSH setup
- Create ~/.ssh and set permissions
```shell
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

- Copy ssh private key from vault, and set permissions

```shell
nano ~/.ssh/id_ed25519

Ctrl+O, Enter, Ctrl+X

chmod 600 ~/.ssh/id_ed25519 #only you read/write
```

- Copy ssh public key from vault, and set permissions

```shell
nano ~/.ssh/id_ed25519.pub

chmod 644 ~/.ssh/id_ed25519.pub #public permissions
```

- Run the following commands
```shell
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

- Test against github
```shell
ssh -T  git@github.com
```
