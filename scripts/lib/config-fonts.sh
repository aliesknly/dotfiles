#!/usr/bin/env bash

# DOWNLOAD_DIR -> temporal directory
# EXTRACT_DIR -> temporal directory
# FONT_URL -> url font to download

config_fonts() {
  local font_folder="$(cd "$HOME/.local/share/fonts/" && pwd)"
  mkdir -p $font_folder
  mv "$EXTRACT_DIR"/*.ttf "$font_folder"
  fc-cache -f -v
}

install_nerd_fonts() {

  local filename=$(basename $FONT_URL)
  local archived_path="$DOWNLOAD_DIR/$filename"

  # Created the need folder
  mkdir -p $DOWNLOAD_DIR
  mkdir -p $EXTRACT_DIR

  if require_command "wget"; then
    cd $DOWNLOAD_DIR && wget -c $FONT_URL -O $filename

    # Check if the download finish ok
    if check_last_proccess; then
      log_info "Nerd font downloaded"
      case $filename in
      *.tar.gz | *.tgz)
        tar -xvzf $archived_path -C $EXTRACT_DIR
        log_info "File extracted .tar"
        ;;
      *.zip)
        unzip $archived_path -d $EXTRACT_DIR
        log_info "File extracted .zip"
        ;;
      *)
        echo "Format not soported"
        log_error "Format no soported"
        ;;
      esac

      config_fonts "$filename"
    else
      log_error "Fail to download Nerd fonts package"
    fi
  else
    log_error "wget isn't installed"
    echo "wget will by installed."
  fi
}
