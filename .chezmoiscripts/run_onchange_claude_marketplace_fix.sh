#!/bin/bash

# This is a workaround for Claude defaulting to pulling it's plugins using SSH, which causes 1Password to prompt for
# the SSH key password every time it tries to update the plugins. This forces it to use HTTPS instead, since the plugin
# repository is public and doesn't require authentication to pull.
#
# See: https://github.com/anthropics/claude-code/issues/14485

mkdir -p ~/.claude/plugins/
cat > ~/.claude/plugins/known_marketplaces.json << 'EOF'
{
  "claude-plugins-official": {
    "source": {
      "source": "git",
      "url": "https://github.com/anthropics/claude-plugins-official.git"
    },
    "installLocation": "~/.claude/plugins/marketplaces/claude-plugins-official",
    "lastUpdated": ""
  }
}
EOF
