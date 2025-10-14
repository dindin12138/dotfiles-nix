# Project Overview

This repository contains personal dotfiles managed with Nix, providing a declarative and reproducible configuration for NixOS and macOS systems. It leverages Nix Flakes and Home Manager to manage system-level and user-level configurations, respectively.

## Key Technologies

*   **Nix:** A powerful package manager and build system that makes package management reliable and reproducible.
*   **NixOS:** A Linux distribution that uses Nix for declarative system configuration.
*   **nix-darwin:** A project that allows managing macOS systems using Nix.
*   **Home Manager:** A tool to manage a user's environment declaratively.
*   **Flakes:** A new feature in Nix that improves reproducibility and composability.

## Architecture

The repository is structured as follows:

*   `flake.nix`: The entry point for the Nix configuration, defining inputs (dependencies) and outputs (system configurations).
*   `hosts/`: Contains the main configuration files for each host (machine).
    *   `configuration.nix`: The main NixOS or macOS configuration file for a specific host.
    *   `home.nix`: The Home Manager configuration for a specific host.
*   `modules/`: Contains reusable modules for configuring different aspects of the system and user environment.
    *   `nixos/`: Modules for NixOS-specific configurations.
    *   `darwin/`: Modules for macOS-specific configurations.
    *   `home-manager/`: Modules for user-specific configurations managed by Home Manager.

# Building and Running

To apply the configuration for a specific host, use the following command:

```bash
nixos-rebuild switch --flake .#<hostname>
```

For example, to apply the configuration for the `80qs` host, run:

```bash
nixos-rebuild switch --flake .#80qs
```

For macOS, the command is:

```bash
darwin-rebuild switch --flake .#<hostname>
```

# Development Conventions

*   **Modularity:** The configuration is organized into reusable modules to keep it clean and maintainable.
*   **Declarative:** The system and user environments are defined declaratively, making them reproducible and easy to reason about.
*   **Per-Host Configuration:** Each host has its own configuration file, allowing for machine-specific settings.
