# DevOpsDockerComposeShopware

This project is part of the **DevOps** learning path of the Shopware Academy.

It shows the reference project state after the practical lab **Running Shopware Locally With Docker Compose**.

It demonstrates how to:

- Build a Shopware application image with a `Dockerfile`.
- Run Shopware locally with Docker Compose.
- Connect the Shopware application container to a MySQL database service.
- Use a Docker volume for database data.
- Expose the local storefront through `http://localhost:8080`.

Tested for **Shopware 6.7** with the Shopware PHP 8.5 container images.

## Reference Project

This repository is an educational reference state for the Academy practical lab. It is meant for comparing your local result with a known working project state.

You do not need to run this project to use it as a reference. The most important files to compare are:

- `Dockerfile`
- `compose.yaml`

These files show the expected Docker image build and Docker Compose runtime setup at the end of the lab. The `compose.yaml` in this repository is the reduced learning setup from the lab, not the generated Shopware CLI development setup.

It is not a production template. The credentials, service names, and runtime settings in `compose.yaml` are intentionally simple for local learning.

## Optional: Run the Project Locally

If you want to run this reference project locally, you still need to build the image, start the containers, and initialize the local Shopware database. You do not need local PHP or Composer for that; Docker uses the Shopware CLI image during the build.

The Compose setup uses the same host ports as the practical lab:

- `8080` for the Shopware storefront
- `3306` for the MySQL database

If your own lab project is still running, stop it first from that project directory:

```bash
docker compose down
```

Build the local Shopware image:

```bash
docker compose build
```

Then start the local Docker Compose setup:

```bash
docker compose up -d
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

## License

MIT License.

You may use this project in commercial and professional projects.
It is provided as an educational example and comes without a warranty and without support.

## Contributing

This project is part of the Shopware Academy curriculum.
