# Development Workflows

This fork of ULO Thesis supports three additional development workflows: local development on Linux with `mise`, development in a VS Code Dev Container, and running the project container directly from a terminal.

## Choosing a Workflow

| Workflow | Best for | Requirements |
|---|---|---|
| Local Linux with `mise` | Users who prefer a native development environment | Linux and `mise` |
| VS Code Dev Container | Users who want a preconfigured editor and isolated toolchain | VS Code, Dev Containers extension, and Docker or Podman |
| Container from the terminal | Users who want an isolated build environment without relying on VS Code | Docker or Podman |

The **VS Code Dev Container** is a convenient default for new contributors who already use VS Code. Local development is suitable for users who prefer working directly on their host, while the terminal-container workflow is useful for scripting and editor-independent builds.

These workflows are alternatives; you do not need to configure all three. The project aims to keep their common build and maintenance commands consistent through `mise.toml`.
The container workflows require less than 2 GB of disk space for the container image, considerably less than a full local LaTeX installation.

## 1. Local Development on Linux with `mise`

This workflow builds the thesis directly on a Linux machine using the tools configured by the project.
This workflow uses the same project tools as the container-based setup, but runs them directly on the host.

### Setup

Install [`mise`](https://mise.jdx.dev/) if it is not already available, then clone the repository:

```sh
git clone https://github.com/patinhooh/ULO-thesis.git
cd ULO-thesis
```

Run the project's setup task and build the thesis:

```sh
mise install   # Install tools
mise run setup # Install dependencies
mise run build
```

### Common tasks

```sh
mise run build
mise run clean
mise run rebuild
mise run watch
mise run format
```

The available tasks and their exact behavior are defined in `mise.toml`. Inspect that file or run `mise tasks` to see the current task definitions.

The main document is `ULOMain.tex`. The build task produces the thesis PDF.

## 2. VS Code with a Dev Container

This workflow uses the development environment configured in the repository. It provides an isolated toolchain and the recommended VS Code extensions.

> [!note]
> You can also use VS Code with a local development environment, without Dev Containers. We include this workflow to showcase the Dev Containers feature and provide an alternative for those who prefer an isolated environment.

### Requirements

- [Visual Studio Code](https://code.visualstudio.com/)
- The VS Code **Dev Containers** extension
- Docker or Podman configured for use with Dev Containers

### Setup

1. Clone the repository and open its directory in VS Code.
2. Open the Command Palette and run **Dev Containers: Reopen in Container**.
3. Wait for the development container to build and initialize.

### Building the thesis

The workspace configures the LaTeX Workshop extension to use the `mise build` recipe, which runs `mise run build`. Automatic building is enabled on save, so you can edit the thesis and let the extension compile it.

To build manually, use LaTeX Workshop's **Build LaTeX project** command from the Command Palette or its TeX toolbar controls.

## 3. Running a Container from the Terminal

This workflow uses the repository's `Containerfile` to build and run the development environment. The container tasks defined in `mise.toml` provide shortcuts for building the image and running common development tasks, such as building, formatting, and cleaning, inside the container.

### Build the container image

From the repository root, run the appropriate task for your container engine.

**Docker:**

```sh
mise run docker:build-image
```

**Podman:**

```sh
mise run pod:build-image
```

### Build the thesis

Once the image has been built, compile the thesis using:

**Docker:**

```sh
mise run docker:build
```

**Podman:**

```sh
mise run pod:build
```

The repository is mounted into the container, so generated files remain available in your working directory after the container exits.

### Other container tasks

The following tasks are also available:

| Task | Docker | Podman |
|---|---|---|
| Open an interactive shell | `mise run docker:shell` | `mise run pod:shell` |
| Format LaTeX sources | `mise run docker:format` | `mise run pod:format` |
| Clean build artifacts | `mise run docker:clean` | `mise run pod:clean` |

These tasks use the container image built in the previous step. If you modify the `Containerfile` or need to refresh the image, run the corresponding image-build task again.

> [!note]
> The Podman tasks configure user-namespace handling and volume labeling for the mounted project directory. These options help ensure that files created inside the container remain accessible from the host.

