# Fish Shell Configuration

Modular fish shell configuration files organized by functionality.

## Structure

- `config.fish`: Main configuration file that loads modular components
- `conf.d/`: Directory for configuration files loaded automatically at startup
  - `paths.fish`: PATH environment variable configuration
  - `aliases.fish`: Command aliases and shortcuts
  - `virtualenv.fish`: Python virtual environment activation
- `functions/`: Directory for fish functions loaded automatically at startup
  - `gss.fish`: Git status with detailed formatting
  - `gc.fish`: GitHub repo cloning function
  - `gp.fish`: Git push function
  - `gpf.fish`: Git force push function
  - `gf.fish`: Git fetch function

## Features

- Organized into logical modules for easier maintenance
- Automatic loading of configuration from `conf.d/` and `functions/` directories
- Git-related helper functions
- Command aliases and environment configuration

## Usage

Fish automatically loads all files in these locations on startup:
- ~/.config/fish/config.fish
- ~/.config/fish/conf.d/*.fish (in alphabetical order)
- ~/.config/fish/functions/*.fish (loaded on-demand)

No manual sourcing required - just place files in the appropriate directories. 