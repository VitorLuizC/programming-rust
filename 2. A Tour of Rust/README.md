# A Tour of Rust

## Disclaimer about Rust's binaries

Since I'm not particularly eager to install stuff globally on my computer, I've written a [`Dockerfile`](#dockerfile) and [`docker-compose.yaml`](#docker-compose) files to execute Rust's binaries from Docker.

So, instead of running directly, I'll run them using `docker-compose`.

```bash
docker-compose run cargo --version
docker-compose run rustc --version
docker-compose run rustdoc --version
```

### About the [`Dockerfile`](../Dockerfile) {#dockerfile}

The only part that matters is the image name, `rust:1.59.0-alpine3.15`. So it uses Rust 1.59.0 on Alpine 3.15, a small Linux distribution built for VMs.

```dockerfile
FROM rust:1.59.0-alpine3.15
WORKDIR /usr/src/app
COPY . ./
```

### About the [`docker-compose.yaml`](../docker-compose.yaml) {#docker-compose}

It defines Rust's binaries as services that run on `Dockerfile`'s build.

```yaml
version: '3.8'

services:
  cargo:
    build: .
    entrypoint: 'cargo'

  rustc:
    build: .
    entrypoint: 'rustc'

  rustdoc:
    build: .
    entrypoint: 'rustdoc'
```

## Binaries

The rust provides three programs: `cargo`, `rustc`, and `rustdoc`.

- `cargo`

  Rust package manager that can also start new projects and run scripts to build, test, format, and others.

- `rustc`

  Rust compiler.

- `rustdoc`

  Rust documentation tool that generates HTML files from my program's source code comments.

Doing some parallels with the JavaScript ecosystem we have:

| Rust      | TS/JS Parallel                                                                                                                  |
| --------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `cargo`   | [`npm`](https://docs.npmjs.com/cli/v8), [`yarn`](https://yarnpkg.com/), or [`pnpm`](https://pnpm.io/)                           |
| `rustc`   | [`tsc`](https://www.typescriptlang.org/docs/handbook/compiler-options.html), or [`babel`](https://babeljs.io/docs/en/babel-cli) |
| `rustdoc` | [`tsdoc`](https://tsdoc.org/), or [`jsdoc`](https://jsdoc.app/)                                                                 |
