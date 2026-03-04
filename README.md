<div align="center">

# asdf-mongodb [![Build](https://github.com/jarjee/asdf-mongodb/actions/workflows/build.yml/badge.svg)](https://github.com/jarjee/asdf-mongodb/actions/workflows/build.yml) [![Lint](https://github.com/jarjee/asdf-mongodb/actions/workflows/lint.yml/badge.svg)](https://github.com/jarjee/asdf-mongodb/actions/workflows/lint.yml)

[mongodb](https://github.com/jarjee/asdf-mongodb) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

Plugin:

```shell
asdf plugin add mongodb
# or
asdf plugin add mongodb https://github.com/jarjee/asdf-mongodb.git
```

mongodb:

```shell
# Show all installable versions
asdf list-all mongodb

# Install specific version
asdf install mongodb latest

# Set a version globally (on your ~/.tool-versions file)
asdf global mongodb latest

# Now mongodb commands are available
mongod --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/jarjee/asdf-mongodb/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Nathan Smyth](https://github.com/jarjee/)
