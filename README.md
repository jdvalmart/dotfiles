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

## 💾 Archivos que NO están en este repo

Estos archivos contienen claves o datos sensibles. Debes respaldarlos **ANTES de formatear**
en un **USB o disco externo** (NUNCA en GitHub):

```bash
# 1. Crear backup manual (en WSL, antes de formatear)
mkdir -p ~/backup-fedora

# Crítico — sin esto pierdes acceso y memoria de agentes
cp -r ~/.ssh        ~/backup-fedora/
cp -r ~/.engram     ~/backup-fedora/

# Importante — configs de herramientas
cp -r ~/.claude     ~/backup-fedora/
cp -r ~/.claude.json ~/backup-fedora/
cp -r ~/.gemini     ~/backup-fedora/
cp -r ~/.openclaw   ~/backup-fedora/
cp -r ~/.opencode   ~/backup-fedora/
cp ~/.tmux.conf     ~/backup-fedora/ 2>/dev/null

# Opcional — ML/Dev
cp -r ~/.jupyter    ~/backup-fedora/ 2>/dev/null
cp -r ~/.keras      ~/backup-fedora/ 2>/dev/null

# 2. Comprimir
tar -czf ~/fedora-backup.tar.gz -C ~/ backup-fedora/

# 3. Copiar a USB (reemplaza /media/usb por tu ruta real)
cp ~/fedora-backup.tar.gz /media/usb/
```

### En Fedora (después de instalar):

```bash
# 1. Conectar USB y extraer
tar -xzf /media/usb/fedora-backup.tar.gz -C ~/

# 2. Mover a sus ubicaciones
cp -r ~/backup-fedora/.ssh ~/
cp -r ~/backup-fedora/.engram ~/
# ... (repetir para cada carpeta)

# 3. Ajustar permisos de SSH
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
```

> ⚠️ **NUNCA** subas este backup a GitHub. Contiene tus claves privadas.

## 👤 Autor

**Juan David Valencia** — Full-Stack Developer / AI Engineer  
📍 Palmira, Colombia  
🔗 [LinkedIn](https://linkedin.com/in/jdvalmart) | [GitHub](https://github.com/jdvalmart) | [Portafolio](https://jdvalmartdev.netlify.app)
