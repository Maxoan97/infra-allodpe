#!/bin/bash

mkdir -p docker odoo/allo_module_template metabase xwiki backup

# Fichiers à la racine
cat <<EOF > README.md
# Infrastructure Allo-DPE

Ce dépôt contient l'infrastructure complète pour le projet Allo-DPE (Odoo, Mistral, Metabase, XWiki, etc.)
EOF

cat <<EOF > .gitignore
__pycache__/
*.pyc
*.log
*.sqlite3
.env
venv/
EOF

# Docker
cat <<EOF > docker/README.md
# Docker

Conteneurs Docker utiles à l’infrastructure (ex : Ollama, PostgreSQL, etc.).
EOF

touch docker/mistral-compose.yml

# Odoo
cat <<EOF > odoo/README.md
# Odoo

Modules personnalisés Odoo pour Allo-DPE.
EOF

cat <<EOF > odoo/allo_module_template/__init__.py
# Initialisation du module
EOF

cat <<EOF > odoo/allo_module_template/__manifest__.py
{
    "name": "Allo Module Template",
    "version": "1.0",
    "category": "Tools",
    "summary": "Module de base pour Allo-DPE",
    "description": "Ce module sert de modèle de base pour le développement Odoo personnalisé.",
    "depends": ["base"],
    "data": [],
    "installable": True,
    "application": False,
}
EOF

# Metabase
cat <<EOF > metabase/README.md
# Metabase

Configuration dockerisée de Metabase pour visualisation BI.
EOF

touch metabase/metabase-compose.yml

# XWiki
cat <<EOF > xwiki/README.md
# XWiki

Configuration de la plateforme de documentation et base de savoir Allo-DPE.
EOF

touch xwiki/xwiki-compose.yml

# Backup
cat <<EOF > backup/README.md
# Sauvegarde

Scripts de backup/restauration du serveur et des bases.
EOF

cat <<'EOF' > backup/backup_serveur.sh
#!/bin/bash
DATE=$(date +%F)
BACKUP_DIR="/home/francis/backups/$DATE"
mkdir -p "$BACKUP_DIR"

echo "🔁 Sauvegarde des fichiers Odoo et configurations"
rsync -a --exclude='__pycache__' /opt/odoo "$BACKUP_DIR"
rsync -a /etc/odoo.conf "$BACKUP_DIR"

echo "🛢️ Sauvegarde de la base PostgreSQL"
pg_dump -U odoo -h localhost allo_dpe > "$BACKUP_DIR/allo_dpe.sql"

echo "✅ Backup terminé : $BACKUP_DIR"
EOF

chmod +x backup/backup_serveur.sh
chmod +x ~/infra-allodpe/setup_structure.sh

echo "🎉 Structure créée avec succès !"
