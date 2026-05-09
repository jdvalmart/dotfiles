#!/bin/bash
set -e

# ═══════════════════════════════════════════
# dotfiles install script — jdvalmart
# Compatible: Fedora 41+, Ubuntu 24.04+
# ═══════════════════════════════════════════

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err()  { echo -e "${RED}[✗]${NC} $1"; }
info() { echo -e "${CYAN}[i]${NC} $1"; }

echo ""
echo "╔═══════════════════════════════════════════╗"
echo "║   jdvalmart dotfiles — install script     ║"
echo "║   Full-Stack Developer / AI Engineer      ║"
echo "╚═══════════════════════════════════════════╝"
echo ""

# ─── Detect OS ───────────────────────────
if [ -f /etc/fedora-release ]; then
    OS="fedora"
    PKG_MGR="dnf"
    info "Detected: Fedora"
elif [ -f /etc/lsb-release ]; then
    OS="ubuntu"
    PKG_MGR="apt"
    info "Detected: Ubuntu"
else
    OS="unknown"
    PKG_MGR=""
    warn "Unknown OS. Package installation will be skipped."
fi

# ─── Install Homebrew ─────────────────────
if ! command -v brew &>/dev/null; then
    echo ""
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add brew to PATH based on architecture
    if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    log "Homebrew installed"
else
    log "Homebrew already installed"
fi

# ─── Install Brew packages ────────────────
if [ -f "$DOTFILES_DIR/packages-brew.txt" ]; then
    echo ""
    info "Installing Brew packages ($(wc -l < "$DOTFILES_DIR/packages-brew.txt") packages)..."
    
    while read -r pkg; do
        [ -z "$pkg" ] && continue
        if brew list "$pkg" &>/dev/null; then
            log "$pkg (already)"
        else
            brew install "$pkg" && log "$pkg" || warn "Failed: $pkg"
        fi
    done < "$DOTFILES_DIR/packages-brew.txt"
    log "Brew packages done"
fi

# ─── Python packages ──────────────────────
echo ""
read -p "$(echo -e ${CYAN}[?]${NC} Install 200+ Python packages? This may take a while [y/N]: )" -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "$DOTFILES_DIR/packages-pip.txt" ]; then
        info "Installing Python packages..."
        pip install -r "$DOTFILES_DIR/packages-pip.txt" 2>&1 | tail -3
        log "Python packages done"
    fi
else
    info "Skipping pip packages. Install manually later: pip install -r packages-pip.txt"
fi

# ─── Node global packages ─────────────────
if [ -f "$DOTFILES_DIR/packages-npm.txt" ]; then
    echo ""
    info "Installing global Node packages..."
    while read -r pkg; do
        [ -z "$pkg" ] && continue
        npm install -g "$pkg" 2>/dev/null && log "$pkg" || warn "Failed: $pkg"
    done < "$DOTFILES_DIR/packages-npm.txt"
    log "Node packages done"
fi

# ─── GPU / ROCm (AMD only) ────────────────
echo ""
if lspci 2>/dev/null | grep -qi "AMD.*Radeon"; then
    read -p "$(echo -e ${CYAN}[?]${NC} AMD GPU detected. Install ROCm for ML acceleration? [y/N]: )" -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [ "$OS" = "fedora" ]; then
            sudo dnf install -y rocm-hip-libraries rocm-hip-sdk
            log "ROCm installed (Fedora)"
        elif [ "$OS" = "ubuntu" ]; then
            warn "ROCm on Ubuntu requires manual setup. See: https://rocm.docs.amd.com"
        fi
    fi
else
    info "No AMD GPU detected. Skipping ROCm."
fi

# ─── Docker ───────────────────────────────
echo ""
if ! command -v docker &>/dev/null; then
    read -p "$(echo -e ${CYAN}[?]${NC} Install Docker? [y/N]: )" -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [ "$OS" = "fedora" ]; then
            sudo dnf install -y dnf-plugins-core
            sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
            sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
            sudo systemctl enable --now docker
            sudo usermod -aG docker "$USER"
            log "Docker installed (Fedora)"
        elif [ "$OS" = "ubuntu" ]; then
            sudo apt update && sudo apt install -y docker.io docker-compose
            sudo systemctl enable --now docker
            sudo usermod -aG docker "$USER"
            log "Docker installed (Ubuntu)"
        fi
    fi
else
    log "Docker already installed"
fi

# ─── Copy dotfiles ────────────────────────
echo ""
info "Linking configuration files..."

cp "$DOTFILES_DIR/config/.bashrc" ~/.bashrc
cp "$DOTFILES_DIR/config/.profile" ~/.profile
cp "$DOTFILES_DIR/config/.gitconfig" ~/.gitconfig
log "Shell + Git config"

cp "$DOTFILES_DIR/config/starship.toml" ~/.config/starship.toml 2>/dev/null || true
cp -r "$DOTFILES_DIR/config/zellij" ~/.config/ 2>/dev/null || true
cp -r "$DOTFILES_DIR/config/wezterm" ~/.config/ 2>/dev/null || true
log "Terminal config (Starship, Zellij, Wezterm)"

# ─── Neovim config ────────────────────────
read -p "$(echo -e ${CYAN}[?]${NC} Copy Neovim config? This will OVERWRITE ~/.config/nvim/ [y/N]: )" -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cp -r "$DOTFILES_DIR/config/nvim" ~/.config/nvim 2>/dev/null && log "Neovim config" || warn "Neovim config not found in backup"
fi

# ─── OpenCode config ──────────────────────
read -p "$(echo -e ${CYAN}[?]${NC} Restore OpenCode (AI agent) configuration? [y/N]: )" -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p ~/.config/opencode
    cp "$DOTFILES_DIR/config/opencode/AGENTS.md" ~/.config/opencode/
    cp "$DOTFILES_DIR/config/opencode/opencode.json" ~/.config/opencode/
    cp "$DOTFILES_DIR/config/opencode/skill-registry.md" ~/.config/opencode/
    cp -r "$DOTFILES_DIR/config/opencode/skills" ~/.config/opencode/
    cp -r "$DOTFILES_DIR/config/opencode/prompts" ~/.config/opencode/
    log "OpenCode config restored"
fi

# ─── SSH keys ─────────────────────────────
echo ""
warn "SSH keys are NOT included in this repo (security)."
warn "Copy them manually:"
warn "  cp /path/to/backup/id_ed25519* ~/.ssh/"
warn "  cp /path/to/backup/id_rsa* ~/.ssh/"

# ─── Clone projects ───────────────────────
echo ""
read -p "$(echo -e ${CYAN}[?]${NC} Clone all your GitHub projects to ~/proyectos/? [y/N]: )" -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p ~/proyectos && cd ~/proyectos
    
    REPOS=(
        "jdvalmart/portafolio-jdvalmart"
        "jdvalmart/book-tracker"
        "jdvalmart/pequeletores"
        "jdvalmart/MachineDeepLearning"
        "jdvalmart/jobboard-api"
        "jdvalmart/metpet-chatbot-nodejs"
        "jdvalmart/usuarios-autenticacion-api"
        "jdvalmart/dotfiles"
    )
    
    for repo in "${REPOS[@]}"; do
        name=$(basename "$repo")
        if [ -d "$name" ]; then
            log "$name (already)"
        else
            git clone "https://github.com/$repo" 2>/dev/null && log "$name" || warn "Failed: $repo"
        fi
    done
    log "Projects cloned"
fi

# ─── Done ─────────────────────────────────
echo ""
echo "╔═══════════════════════════════════════════╗"
echo "║         Installation complete! 🚀         ║"
echo "╚═══════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. source ~/.bashrc"
echo "  2. Copy your SSH keys to ~/.ssh/"
echo "  3. Configure Git: git config --global user.name 'Juan Valencia'"
echo "  4. Start coding!"
echo ""
