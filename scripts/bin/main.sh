#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../config/app.conf"
source "$SCRIPT_DIR/../lib/logger.sh"
source "$SCRIPT_DIR/../lib/ui.sh"
source "$SCRIPT_DIR/../lib/install-editor.sh"
source "$SCRIPT_DIR/../lib/backup-original-config.sh"
source "$SCRIPT_DIR/../lib/validate.sh"
source "$SCRIPT_DIR/../lib/add-config-to-my-repo.sh"
source "$SCRIPT_DIR/../lib/restore_my_own_config.sh"
source "$SCRIPT_DIR/../lib/config-fonts.sh"

main() {
  log_info "start script"
  run_ui
  log_info "end script"
}

main "$@"
