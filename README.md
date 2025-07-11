# Infrastructure Allo-DPE

Ce dépôt contient l'infrastructure complète pour le projet Allo-DPE (Odoo, Mistral, Metabase, XWiki, etc.)

## 🧩 Services utilisés

- **Odoo 18** Community – ERP principal
- **Mistral AI** (via Ollama) – LLM pour requêtes intelligentes
- **pgvector** – Stockage de vecteurs pour les embeddings
- **Metabase** – Dashboards interactifs sur la base PostgreSQL
- **XWiki** – Base documentaire vectorisée
- **LangChain** – Orchestration IA
- **PostgreSQL** – Base de données centralisée
- **NGINX + Certbot** – Reverse proxy sécurisé HTTPS

---

## 📋 Environnements & Checklist

### 🔧 1. Environnement **Développement**

| Élément             | Statut         |
|---------------------|----------------|
| VM dédiée ou clone de prod            | ✅ ou ⬜️ |
| Serveurs exposés en local ou sous-sous-domaine (ex: `dev.allo-dpe.fr`) | ✅ ou ⬜️ |
| Modules Odoo déployés localement      | ✅ ou ⬜️ |
| Reload automatique Odoo + logs clairs | ✅ ou ⬜️ |
| Vectorisation et API IA configurées   | ✅ ou ⬜️ |
| Metabase pointée sur base locale      | ✅ ou ⬜️ |
| XWiki accessible localement           | ✅ ou ⬜️ |

---

### 🧪 2. Environnement **Test / Recette**

| Élément             | Statut         |
|---------------------|----------------|
| Clone exact de prod, avec base nettoyée / mockée | ✅ ou ⬜️ |
| CI/CD (auto-deploy via GitHub ou autre)          | ✅ ou ⬜️ |
| Monitoring erreurs activé                         | ✅ ou ⬜️ |
| Accès restreint avec authentification             | ✅ ou ⬜️ |
| Scripts de test de requêtes IA validés            | ✅ ou ⬜️ |
| Logs SQL / LangChain / Odoo captés et archivés    | ✅ ou ⬜️ |

---

### 🌐 3. Environnement **Production**

| Élément             | Statut         |
|---------------------|----------------|
| HTTPS via Nginx + Certbot             | ✅ ou ⬜️ |
| Scripts de backup actifs (cron + externalisation) | ✅ ou ⬜️ |
| Alerting basique (journalctl/systemctl, fail2ban) | ✅ ou ⬜️ |
| Odoo sur sous-domaine `green.allo-dpe.fr`         | ✅ ou ⬜️ |
| Metabase sur `bi.allo-dpe.fr`                     | ✅ ou ⬜️ |
| XWiki sur `doc.allo-dpe.fr`                       | ✅ ou ⬜️ |
| Modèle Mistral en local (RAM suffisante)          | ✅ ou ⬜️ |
| Table `pgvector` correctement indexée             | ✅ ou ⬜️ |

---

## 🔐 Sécurité & Accès

- 🔑 SSH avec clés uniquement
- 🚫 Aucun accès root par défaut
- 🔒 Reverse proxy obligatoire (NGINX)
- 📦 Données sauvegardées localement + à distance (optionnel)

---

## 🧠 Bonnes pratiques

- Une branche `main` pour prod
- Une branche `dev` pour tests
- Pull Request obligatoire pour fusionner
- Scripts Python isolés dans un dossier à part (ex: `scripts/`)
- `venv` à ne jamais versionner

---

Souhaite-tu aussi qu’on pousse un modèle de `pull_request_template.md` ou `CONTRIBUTING.md` ?
