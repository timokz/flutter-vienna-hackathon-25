# wien_talks_flutter

A new Flutter project with Serverpod.

## Getting Started

This project is a starting point for a Flutter application that is using
Serverpod.

A great starting point for learning Serverpod is our documentation site at:
[https://docs.serverpod.dev](https://docs.serverpod.dev).

To run the project, first make sure that the server is running, then do:

    flutter run

## Flutter start:

add environment variable in the Additional arguments field in Android Studio:

--dart-define=SERVER_URL=http://localhost:5432/

Note: Host MUST end with a slash

## docker start:

wien_talks_server>docker compose -f docker-compose.local.yaml up -d