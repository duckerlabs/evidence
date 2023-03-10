# Evidence Docker Image

This repository builds the Evidence development environment Docker image. An
instance container can be used as a development environment for Evidence
projects using a mounted directory.  Using this container allows end users to
develop Evidence sites without the need for installing any toolchains besides
`Docker`.

## Pre-requisites

Docker tools are installed using [Docker
Desktop](https://www.docker.com/products/docker-desktop/) (recommended) OR
using [binaries](https://docs.docker.com/engine/install/binaries/).

## Set up an alias for running the Evidence docker image

```sh
    alias evidence='docker run --rm -it -v=$(pwd)/pages:/evidence-workspace/pages -p=3000:3000 duckerlabs/evidence'
```

Note: if you are running Evidence from a new Apple Silicon MacBook (or any
machine with an `arm` chipset), you'll have to provide a `--platform
linux/amd64` argument to Docker as well.

## Running the development environment using Docker commands (Alternative 1)

* Creating a **new Evidence project** from scratch using the Evidence project template
```sh
    cd <path-to-your-evidence-project-root> #i.e the directory where you'd like your Evidence project to be rooted
    evidence --init

    # - You should see the template site up when you point your browser to localhost:3000.
    # - You should see new files, copied from the Evidence project template, in <path-to-your-evidence-project-root>/pages.
    # - Any subsequent edits made in <path-to-your-evidence-project-root>/pages should be reflected on the browser.
```

* Work with an **existing Evidence** project

```sh
    cd <path-to-your-evidence-project-root>
    evidence

    # - You should see your site up when you point your browser to localhost:3000. 
    # - Any edits made in <path-to-your-evidence-project-root> should be reflected on the browser.
```

## Connecting to a Dababase from the development container

If your database is hosted on your `host` machine, you'll have to ensure that
the Database host is set to `host.docker.internal` either via the settings or
your database config file (instead of `localhost`, `0.0.0.0`, etc).  For
instance:
```
{
    "host": "host.docker.internal",
    "database": "yourDBname",
    "port": 5432,
    "user": "yourUsername"
}
```

If your database is hosted externally (e.g on the cloud), you'll have to ensure
your docker container has permissions to access the outside world.

## Stopping the running container

Abort the terminal window  using `CTRL+C` or use the Docker [command
line](https://docs.docker.com/engine/reference/commandline/stop/) or Docker
Desktop to stop the running container.

## Building and running the image locally 

* This only applies to the development of this Docker image.

```sh
    git clone https://github.com/duckerlabs/evidence.git
    make build

    cd <path-to-your-evidence-project-root>
    docker run -v=$(pwd):/evidence-workspace -p=3000:3000 -it --rm <image-name> <command-to-run>
```

## Acknowledgements

This repo is adapted from https://github.com/evidence-dev/docker-devenv
