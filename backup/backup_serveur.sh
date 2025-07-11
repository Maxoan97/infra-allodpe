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
