# Skill Registry

**Delegator use only.** Sub-agents receive compact rules pre-digested via orchestrator injection.
Do NOT read individual SKILL.md files — rules arrive in the sub-agent prompt.

---

## User Skills (Actualizado para perfil v3)

| Trigger | Skill | Path |
|---------|-------|------|
| NLP, sentiment, text, chatbots, HuggingFace | nlp-ai | ~/.config/opencode/skills/skills/nlp-ai/SKILL.md |
| Deep Learning, CNNs, XAI, TensorFlow, PyTorch | ml-pipeline | ~/.config/opencode/skills/skills/ml-pipeline/SKILL.md |
| ML deployment, model serving, Docker for ML, MLOps | ml-ops | ~/.config/opencode/skills/skills/ml-ops/SKILL.md |
| React components, hooks, state management | react-frontend | ~/.config/opencode/skills/skills/react-frontend/SKILL.md |
| FastAPI routes, APIs, Python backend | fastapi-backend | ~/.config/opencode/skills/skills/fastapi-backend/SKILL.md |
| NestJS backend, modules, DTOs | nestjs-backend | ~/.config/opencode/skills/skills/nestjs-backend/SKILL.md |
| PostgreSQL + Docker development | docker-postgres | ~/.config/opencode/skills/skills/docker-postgres/SKILL.md |
| SQLAlchemy async patterns | sqlalchemy-async | ~/.config/opencode/skills/skills/sqlalchemy-async/SKILL.md |
| Writing tests, test coverage, Vitest, pytest | testing | ~/.config/opencode/skills/skills/testing/SKILL.md |
| Software architecture, design patterns, clean code | clean-architecture | ~/.config/opencode/skills/skills/clean-architecture/SKILL.md |
| PR creation, pull request | branch-pr | ~/.config/opencode/skills/skills/branch-pr/SKILL.md |
| GitHub issue, bug report | issue-creation | ~/.config/opencode/skills/skills/issue-creation/SKILL.md |
| Creating new AI skills | skill-creator | ~/.config/opencode/skills/skills/skill-creator/SKILL.md |
| Judgment day, adversarial review | judgment-day | ~/.config/opencode/skills/skills/judgment-day/SKILL.md |

---

## Compact Rules

### nlp-ai (Enfoque principal)
- Empieza con modelos pre-entrenados de HuggingFace — no entrenes desde cero
- Usa pipeline() para inferencia rápida
- Fine-tune solo si el modelo base no funciona
- Herramientas: transformers, spacy, HuggingFace, sklearn

### ml-pipeline
- Deep Learning: PyTorch, TensorFlow, Keras
- CNN para imágenes: CIFAR-10
- XAI: LIME, SHAP, Grad-CAM
- Deployment: Flask, FastAPI

### ml-ops (GAP — mejorar)
- Empieza local: FastAPI + modelo primero
- Luego Docker: containerizar
- Último Cloud: deploy
- Model versioning: HuggingFace Hub

### testing (GAP — mejorar)
- Unit → Integration → E2E
- Frontend: Vitest + React Testing Library
- Backend: pytest + httpx
- Objetivo: Coverage > 80%

### clean-architecture (GAP — mejorar)
- Frontend: Container/Presentational
- Backend: Repository + Service layer
- No over-engineering en proyectos pequeños

### react-frontend
- Functional components + hooks
- TypeScript con interfaces para props/state
- Tailwind CSS para estilos
- Container/Presentational pattern

### fastapi-backend
- Async by default
- Pydantic models para request/response
- Depends() para dependency injection
- Routers para organizar endpoints

### nestjs-backend
- Modular architecture
- Service layer para business logic
- DTOs con class-validator
- Jest incluido

### docker-postgres
- healthcheck para readiness
- Volumes para persistencia
- DATABASE_URL en .env

### sqlalchemy-async
- load_dotenv() ANTES de imports sqlalchemy
- Import ALL models antes de create_all()
- pool_pre_ping=True

---

## Juan David Valencia — Perfil v3.0

### Datos
| Campo | Valor |
|-------|-------|
| **Nombre** | Juan David Valencia |
| **Título** | Full-Stack Developer / AI Engineer |
| **Experiencia** | 4 años |
| **Ubicación** | Palmira, Colombia |
| **Formación** | Politécnico Grancolombiano + SENA + MINTIC (20 semanas IA) |

### Stack
| Capa | Tecnologías |
|------|------------|
| **Frontend** | React, TypeScript, Vue.js |
| **Backend** | FastAPI, NestJS |
| **DB** | PostgreSQL |
| **AI/NLP** | transformers, HuggingFace, spacy, TensorFlow |
| **DevOps** | Docker, Git/GitHub |

### Gaps priorizados
1. 🔴 MLOps (2/10) — sin experiencia en deployment de modelos
2. 🔴 Testing (3/10)
3. 🟡 Clean Architecture (3/10)

---

## Workflow

1. **Investigación**: nlp-ai o ml-pipeline
2. **Arquitectura**: clean-architecture
3. **Testing**: testing
4. **Deployment**: ml-ops

---

*Registry central — v3.0*
*Última actualización: Mayo 2026*