<div align="center">

# asdf-mongodb [![Build](https://github.com/jarjee/asdf-mongodb/actions/workflows/build.yml/badge.svg)](https://github.com/jarjee/asdf-mongodb/actions/workflows/build.yml) [![Lint](https://github.com/jarjee/asdf-mongodb/actions/workflows/lint.yml/badge.svg)](https://github.com/jarjee/asdf-mongodb/actions/workflows/lint.yml)

[MongoDB](https://www.mongodb.com) plugin for the [asdf version manager](https://asdf-vm.com).

Installs `mongod`, `mongos`, and related CLI tools. Backed by [aheckmann/m](https://github.com/aheckmann/m).

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

MongoDB:

```shell
# Show all installable versions
asdf list-all mongodb

# Install specific version
asdf install mongodb latest

# Set a version globally (on your ~/.tool-versions file)
asdf global mongodb latest

# Now MongoDB commands are available
mongod --help
mongos --help

# Uninstall a version
asdf uninstall mongodb <version>
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! Open an issue or pull request on [GitHub](https://github.com/jarjee/asdf-mongodb).

[Thanks goes to these contributors](https://github.com/jarjee/asdf-mongodb/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Nathan Smyth](https://github.com/jarjee/)
