# ============================================================================
# ZSH CONFIGURATION FILE
# ============================================================================
# This file configures the Zsh shell with modern tooling including:
# - Powerlevel10k theme for a beautiful and informative prompt
# - Zinit plugin manager for fast plugin loading
# - Enhanced completion, history, and navigation features
# - Development-focused PATH configurations and aliases
# ============================================================================

# ============================================================================
# INSTANT PROMPT INITIALIZATION
# ============================================================================
# Enable Powerlevel10k instant prompt for faster shell startup.
# This must stay close to the top of ~/.zshrc for optimal performance.
# Any initialization code that requires console input (password prompts, 
# [y/n] confirmations, etc.) must go above this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# PATH CONFIGURATION
# ============================================================================
# Load all PATH-related configurations from a separate file for better organization.
# This keeps PATH management centralized and makes it easier to maintain
# development tool configurations across different environments.

# Source PATH configuration file
# Contains all PATH modifications, development tools, and runtime configurations
if [[ -f ~/.zshpathrc ]]; then
  source ~/.zshpathrc
else
  echo "Warning: .zshpathrc not found. PATH may not be properly configured."
fi

# ============================================================================
# PLUGIN MANAGER SETUP (ZINIT)
# ============================================================================
# Zinit is a flexible and fast Zsh plugin manager that provides:
# - Turbo mode for faster shell startup
# - Conditional loading and lazy loading
# - Plugin update management and rollback capabilities

# Set the directory where Zinit and plugins will be stored
# Uses XDG Base Directory specification for clean organization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download and install Zinit if it's not already present
# This ensures the configuration works on fresh systems
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load the Zinit plugin manager
source "${ZINIT_HOME}/zinit.zsh"

# ============================================================================
# PLUGIN LOADING
# ============================================================================
# Load essential Zsh plugins that enhance the shell experience.
# Plugins are loaded via Zinit for optimal performance and management.

# Syntax highlighting: Highlights command syntax as you type
# Provides immediate visual feedback on command validity
zinit light zsh-users/zsh-syntax-highlighting

# Completions: Additional completion definitions for common tools
# Extends Zsh's built-in completions with community-maintained ones
zinit light zsh-users/zsh-completions

# Autosuggestions: Suggests commands based on history as you type
# Dramatically speeds up command entry by learning from your patterns
zinit light zsh-users/zsh-autosuggestions

# FZF Tab: Replaces default tab completion with fuzzy finder
# Provides interactive, searchable completion menus
zinit light Aloxaf/fzf-tab

# Load Zsh completion system
# Must be called after loading completion plugins but before setting completion styles
autoload -U compinit && compinit

# Powerlevel10k theme: Modern, fast, and highly customizable prompt
# Loaded with shallow clone (depth=1) for faster installation
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load Powerlevel10k configuration if it exists
# Run 'p10k configure' to create/modify this configuration file
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# SHELL OPTIONS & HISTORY CONFIGURATION
# ============================================================================
# Configure shell behavior and history management for optimal workflow.
# These settings enable persistent, searchable command history across sessions.

# History size configuration
HISTSIZE=5000                    # Number of commands to remember in current session
HISTFILE=~/.zsh_history         # File to store command history
SAVEHIST=$HISTSIZE              # Number of commands to save to history file
HISTDUP=erase                   # Remove older duplicate entries when adding new ones

# History behavior options
setopt appendhistory            # Append to history file instead of overwriting
setopt sharehistory            # Share history across all active Zsh sessions
setopt hist_ignore_space       # Don't record commands that start with a space
setopt hist_ignore_all_dups    # Remove all earlier duplicate entries from history
setopt hist_save_no_dups       # Don't save duplicate entries to history file
setopt hist_ignore_dups        # Don't record consecutive duplicate commands
setopt hist_find_no_dups       # Don't display duplicates when searching history

# ============================================================================
# COMPLETION CONFIGURATION
# ============================================================================
# Configure Zsh's completion system for enhanced user experience.
# These settings improve completion behavior and visual presentation.

# Enable case-insensitive completion matching
# Allows typing 'cd doc' to complete 'Documents' directory
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Use colors in completion menus (matches ls colors)
# Provides visual distinction between different types of completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disable default completion menu in favor of fzf-tab
# This allows fzf-tab to handle completion presentation
zstyle ':completion:*' menu no

# Configure fzf-tab preview for cd command
# Shows directory contents when completing cd commands
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Configure fzf-tab preview for zoxide commands
# Shows directory contents when using zoxide navigation
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ============================================================================
# KEYBINDINGS
# ============================================================================
# Configure key bindings for enhanced command-line navigation and editing.
# Uses Emacs-style bindings with custom additions for history search.

# Use Emacs key bindings (as opposed to Vi mode)
# Provides familiar Ctrl+A (beginning), Ctrl+E (end), etc.
bindkey -e

# Enhanced history search bindings
# These work with the autosuggestions plugin for intelligent history navigation
bindkey '^p' history-search-backward    # Ctrl+P: Search backward through history
bindkey '^n' history-search-forward     # Ctrl+N: Search forward through history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Initialize FZF (Fuzzy Finder) integration
# Provides Ctrl+R for fuzzy history search, Ctrl+T for fuzzy file search
eval "$(fzf --zsh)"

# Initialize Zoxide (smart cd replacement)
# Replaces 'cd' command with intelligent directory jumping based on frecency
# Usage: 'cd keyword' jumps to most relevant directory containing keyword
# See: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"
