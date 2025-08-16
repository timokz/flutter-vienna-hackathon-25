# wien_talks_server

## Local Development Environment

Setting up a local postgres container, run the following:

```bash
make local
```

This will first create an `.env` file with default values and then launch the
container.

You can then launch the Serverpod server like so:

```bash
dart bin/main.dart
```

If your database schema isn't initialized yet, you will have to run the
following:

```bash
dart bin/main.dart --apply-migrations
```

See the `Makefile` for all targets.

## Passwords

The password used in your environment files (`.env` for local development and
`env.d/postgres.env.template` for deployment) must correspond to the password in
`config/passwords.yaml`.

The `config/passwords.yaml` file must be created manually at the moment; for
example:

```yaml
development:
  database: your-password-here
```


