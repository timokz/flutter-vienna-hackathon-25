# wien_talks_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop

## Environments & Passwords

Note that the password used in your environment files (`.env` for local
development and `env.d/postgres.env.template` for deployment) must correspond to
the password in `config/passwords.yaml`.

The `config/passwords.yaml` file must be created manually, for example:

```yaml
development:
  database: your-password-here
```

