#!/bin/bash
INDEX_FILE="sessions/index.html"

# Create sessions folder if it doesn't exist
mkdir -p sessions

# HTML header
cat <<HTML > "$INDEX_FILE"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PayloadLab Sessions</title>
  <style>
    body { font-family: sans-serif; margin: 2rem; background: #0d0d0d; color: #f5f5f5; }
    h1 { color: #ff4d4d; }
    a { color: #66ccff; text-decoration: none; }
    a:hover { text-decoration: underline; }
    ul { list-style: none; padding: 0; }
    li { margin: 0.5rem 0; }
  </style>
</head>
<body>
  <h1>PayloadLab Sessions</h1>
  <ul>
HTML

# Read sessions.log and add links
if [ -f sessions.log ]; then
  tac sessions.log | while read -r line; do
    DATE=\$(echo "\$line" | cut -d' ' -f1)
    URL=\$(echo "\$line" | cut -d' ' -f3)
    echo "    <li><a href='\$URL' target='_blank'>Session \$DATE</a></li>" >> "$INDEX_FILE"
  done
fi

# HTML footer
cat <<HTML >> "$INDEX_FILE"
  </ul>
</body>
</html>
HTML
