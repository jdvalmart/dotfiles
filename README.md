# 🐧 jdvalmart dotfiles

Configuración completa de mi entorno de desarrollo: Full-Stack + AI/ML.
Creado para migrar de WSL a Fedora (o cualquier Linux) en minutos.

## 🚀 Quick Start

```bash
git clone https://github.com/jdvalmart/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

## 📦 ¿Qué incluye?

| Categoría | Herramientas |
|-----------|-------------|
| **Shell** | Bash (.bashrc, .profile, starship prompt) |
| **Terminal** | Zellij (multiplexer), Wezterm |
| **Editor** | Neovim con plugins LazyVim |
| **AI Agent** | OpenCode (gentleman + sdd-orchestrator) |
| **DevOps** | Docker, Git, GitHub CLI |
| **Backend** | Python 3.13, Node.js, FastAPI, NestJS |
| **ML/AI** | TensorFlow, PyTorch, HuggingFace, scikit-learn |
| **GPU** | ROCm (AMD Radeon) — opcional |

## 🖥️ Compatibilidad

| OS | Estado |
|----|--------|
| **Fedora 41+** | ✅ Recomendado |
| **Ubuntu 24.04+** | ✅ Soportado |
| **WSL2** | ⚠️ Origen de este backup |
| **macOS** | ❌ No compatible |

## 📂 Estructura

```
dotfiles/
├── install.sh              ← Script inteligente (detecta OS, GPU, etc.)
├── README.md
├── packages-brew.txt        ← 28 paquetes Homebrew
├── packages-pip.txt         ← 200+ paquetes Python/ML
├── packages-npm.txt         ← Paquetes Node globales
└── config/
    ├── .bashrc
    ├── .profile
    ├── .gitconfig
    ├── starship.toml
    ├── zellij/
    ├── wezterm/
    ├── nvim/
    └── opencode/
        ├── AGENTS.md
        ├── opencode.json
        ├── skill-registry.md
        ├── skills/
        └── prompts/
```

## ⚙️ ¿Qué hace el script?

1. **Detecta** el sistema operativo (Fedora/Ubuntu)
2. **Instala** Homebrew + 28 paquetes
3. **Pregunta** antes de instalar paquetes grandes (pip, ROCm)
4. **Copia** todas las configuraciones a `~/.config/`
5. **Restaura** OpenCode con skills, prompts, y perfil
6. **Clona** todos tus proyectos desde GitHub
7. **Muestra** los pasos manuales pendientes

## 🔑 Requisitos manuales

El script NO incluye (por seguridad):

| Qué | Cómo |
|-----|------|
| **SSH keys** | Copiar de backup manual |
| **GitHub token** | `gh auth login` |
| **Notion API token** | Configurar en OpenCode |
| **HuggingFace token** | `huggingface-cli login` |

## 👤 Autor

**Juan David Valencia** — Full-Stack Developer / AI Engineer  
📍 Palmira, Colombia  
🔗 [LinkedIn](https://linkedin.com/in/jdvalmart) | [GitHub](https://github.com/jdvalmart) | [Portafolio](https://jdvalmartdev.netlify.app)
