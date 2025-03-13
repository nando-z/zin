#!/bin/bash

# Script to automate setup of vue-language-server for Neovim

set -e  # Exit on error

echo "=== Setting up vue-language-server for Neovim ==="

# Step 1: Install vue-language-server
read -p "Install vue-language-server globally? (y/n): " install_globally

if [[ "$install_globally" == "y" || "$install_globally" == "Y" ]]; then
    echo "Installing @volar/vue-language-server globally..."
    npm install -g @volar/vue-language-server
else
    echo "Installing @volar/vue-language-server locally in the current project..."
    if [[ ! -f "package.json" ]]; then
        echo "No package.json found. Initializing a new Node.js project..."
        npm init -y
    fi
    npm install --save-dev @volar/vue-language-server
fi

# Step 2: Verify installation
if [[ "$install_globally" == "y" || "$install_globally" == "Y" ]]; then
    VUE_LS_PATH=$(which vue-language-server)
else
    VUE_LS_PATH="./node_modules/.bin/vue-language-server"
fi

if [[ -x "$VUE_LS_PATH" ]]; then
    echo "vue-language-server installed successfully at $VUE_LS_PATH"
else
    echo "Error: vue-language-server is not executable or not found."
    echo "Ensure it's installed correctly and added to your PATH."
    exit 1
fi

# Step 3: Add Neovim LSP configuration
NEOVIM_CONFIG_DIR="$HOME/.config/nvim/lua"
LSP_CONFIG_FILE="$NEOVIM_CONFIG_DIR/lsp-config.lua"

mkdir -p "$NEOVIM_CONFIG_DIR"

cat <<EOF > "$LSP_CONFIG_FILE"
-- ~/.config/nvim/lua/lsp-config.lua
local lspconfig = require("lspconfig")

-- Vue (Volar)
lspconfig.volar.setup({
    cmd = { "$VUE_LS_PATH", "--stdio" },
    on_attach = function(client, bufnr)
        -- Enable autocompletion
        require("cmp_nvim_lsp").default_capabilities()
    end,
    filetypes = { "vue" }, -- Specify filetypes for Vue files
})

EOF

echo "Neovim LSP configuration updated for vue-language-server."

# Step 4: Final instructions
echo "=== Setup Complete ==="
echo "1. Restart Neovim."
echo "2. Open a .vue file and verify that vue-language-server starts."
echo "   Use :LspInfo to check the active language server."
