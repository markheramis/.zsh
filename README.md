# Zsh

A comprehensive Zsh configuration featuring modern tooling, beautiful theming, and enhanced productivity features.

## Features

- **Powerlevel10k Theme**: Beautiful and informative prompt with instant loading
- **Zinit Plugin Manager**: Fast plugin loading with turbo mode
- **Enhanced Completion**: Fuzzy finding with fzf-tab integration
- **Smart History**: Persistent, searchable command history across sessions
- **Syntax Highlighting**: Real-time command syntax validation
- **Auto-suggestions**: Command suggestions based on history
- **Smart Navigation**: Zoxide integration for intelligent directory jumping
- **Development Tools**: Pre-configured PATH for common development environments

## Prerequisites

### Required Software

Before installing this configuration, ensure you have the following software installed:

#### 1. Git
Git is required for cloning repositories and plugin management.
- **Installation**: Follow the official installation guide at [git-scm.com](https://git-scm.com/downloads)

#### 2. FZF (Fuzzy Finder)
FZF provides fuzzy finding capabilities for enhanced command completion and history search.
- **Installation**: See installation instructions at [github.com/junegunn/fzf](https://github.com/junegunn/fzf#installation)

#### 3. Zoxide (Smart cd replacement)
Zoxide enables intelligent directory jumping based on frecency (frequency + recency).
- **Installation**: Follow the installation guide at [github.com/ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide#installation)

### Required Nerd Font

This configuration uses Powerlevel10k which requires a **Nerd Font** for proper icon display.

- **Installation**: Download and install any Nerd Font from [github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
- **Recommended**: MesloLGS NF (specifically recommended by Powerlevel10k)
- **Configuration**: Set your terminal to use the installed Nerd Font

## Installation

### 1. Clone or Download Configuration Files

Place the following files in your desired location:
- `.zshrc` - Main Zsh configuration
- `.zshpathrc` - PATH and aliases configuration
- `install.sh` - Installation script

### 2. Backup Existing Configuration

The install script automatically backs up your existing `.zshrc`:
```bash
# Your existing .zshrc will be saved as ~/.zshrc.bak
```

### 3. Run Installation Script

```bash
chmod +x install.sh
./install.sh
```

This script will:
- Backup your existing `.zshrc` to `~/.zshrc.bak`
- Create symbolic links to the new configuration files

### 4. Restart Your Terminal

Close and reopen your terminal or run:
```bash
source ~/.zshrc
```

### 5. Configure Powerlevel10k (First Run)

On first launch, Powerlevel10k will automatically start the configuration wizard:
```bash
p10k configure
```

Follow the interactive prompts to customize your prompt appearance.

## Configuration Files

### `.zshrc`
Main configuration file containing:
- Plugin management with Zinit
- Powerlevel10k theme setup
- History configuration
- Completion settings
- Key bindings

### `.zshpathrc`
Separate PATH configuration file containing:
- Homebrew environment setup
- Development tools PATH configuration
- Programming language runtimes
- Command aliases

## Key Features & Usage

### Enhanced History Search
- `Ctrl+P`: Search backward through history
- `Ctrl+N`: Search forward through history
- `Ctrl+R`: Fuzzy search through history (FZF)

### Smart Directory Navigation
```bash
# Traditional cd
cd /path/to/directory

# Smart cd with zoxide (after visiting directories)
cd keyword  # Jumps to most relevant directory containing "keyword"
```

### Fuzzy File Finding
- `Ctrl+T`: Fuzzy find files in current directory
- Tab completion with fuzzy search for commands

### Auto-suggestions
- Type any command and see suggestions based on your history
- Press `→` (right arrow) to accept suggestion

## Customization

### Adding New PATH Entries
Edit `.zshpathrc` and add your custom PATH modifications:
```bash
export PATH="/your/custom/path:$PATH"
```

### Adding Custom Aliases
Add aliases to the bottom of `.zshpathrc`:
```bash
alias myalias='my command'
```

### Plugin Management
Add new plugins in `.zshrc`:
```bash
zinit light author/plugin-name
```

## Troubleshooting

### Icons Not Displaying
- Ensure you have a Nerd Font installed and configured in your terminal
- Run `p10k configure` to reconfigure the prompt

### Slow Shell Startup
- Check if all PATH entries in `.zshpathrc` point to existing directories
- Consider using Zinit's turbo mode for additional plugins

### Plugin Issues
- Update plugins: `zinit update`
- Reinstall Zinit: Remove `~/.local/share/zinit` and restart terminal

### PATH Issues
- Check PATH configuration: `echo $PATH`
- Verify `.zshpathrc` is being sourced: Add `echo "PATH loaded"` temporarily

## Uninstallation

To revert to your previous configuration:

1. Remove symbolic links:
```bash
rm ~/.zshrc ~/.zshpathrc
```

2. Restore backup:
```bash
mv ~/.zshrc.bak ~/.zshrc
```

3. Restart your terminal

## License

This configuration is provided as-is for personal and educational use.
