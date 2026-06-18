# DevOpsDockerComposeShopware

This project is part of the **DevOps** learning path of the Shopware Academy.

It shows the reference project state after the practical lab **Running Shopware Locally With Docker Compose**.

It demonstrates how to:

- Build a Shopware application image with a `Dockerfile`.
- Run Shopware locally with Docker Compose.
- Connect the Shopware application container to a MySQL database service.
- Use a Docker volume for database data.
- Expose the local storefront through `http://localhost:8080`.

Tested for **Shopware 6.7**.

## Usage

This repository contains the file state after the practical lab. After cloning it, you still need to build the image, start the containers, and initialize the local Shopware database.

Build and start the local Docker Compose setup:

```bash
docker compose up -d --build
```

Check the running services:

```bash
docker compose ps
```

When the `database` service is healthy and the `shopware` service is running, install Shopware inside the application container:

```bash
docker compose exec -u82 shopware bin/console system:install --basic-setup --create-database --skip-first-run-wizard
```

Then open the storefront in your browser:

```txt
http://localhost:8080
```

If you want to inspect the logs, run:

```bash
docker compose logs -f
```

Stop the setup:

```bash
docker compose down
```

## Reference Project

This repository is an educational reference state for the Academy practical lab. It is meant for comparing your local result with a known working project state.

It is not a production template. The credentials, service names, and runtime settings in `compose.yaml` are intentionally simple for local learning.

## License

MIT License.

You may use this project in commercial and professional projects.
It is provided as an educational example and comes without a warranty and without support.

## Contributing

This project is part of the Shopware Academy curriculum.
