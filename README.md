# Modern Zsh Configuration

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

#### 1. Homebrew (macOS Package Manager)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. Git
```bash
brew install git
```

#### 3. FZF (Fuzzy Finder)
```bash
brew install fzf
```

#### 4. Zoxide (Smart cd replacement)
```bash
brew install zoxide
```

#### 5. Optional Development Tools
The configuration includes PATH settings for these optional tools:

- **Cursor IDE**: Download from [cursor.sh](https://cursor.sh)
- **Ollama AI**: Download from [ollama.ai](https://ollama.ai)
- **PHP 8.3**: `brew install php@8.3`

### Required Nerd Font

This configuration uses Powerlevel10k which requires a **Nerd Font** for proper icon display.

#### Recommended Fonts:
- **MesloLGS NF** (Recommended by Powerlevel10k)
- **JetBrains Mono Nerd Font**
- **Fira Code Nerd Font**
- **Hack Nerd Font**

#### Installation Options:

**Option 1: Homebrew (Recommended)**
```bash
# Install MesloLGS NF (recommended)
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font

# Or install JetBrains Mono Nerd Font
brew install font-jetbrains-mono-nerd-font
```

**Option 2: Manual Download**
1. Visit [Nerd Fonts Releases](https://github.com/ryanoasis/nerd-fonts/releases)
2. Download your preferred font (e.g., `Meslo.zip`)
3. Extract and install the font files
4. Configure your terminal to use the installed Nerd Font

#### Terminal Configuration
After installing a Nerd Font, configure your terminal application:

- **iTerm2**: Preferences → Profiles → Text → Font
- **Terminal.app**: Preferences → Profiles → Font
- **VS Code Terminal**: Settings → Terminal › Integrated: Font Family
- **Cursor Terminal**: Settings → Terminal › Integrated: Font Family

Set the font to your installed Nerd Font (e.g., "MesloLGS Nerd Font").

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
