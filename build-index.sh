#!/bin/bash
INDEX_FILE="sessions/index.html"

mkdir -p sessions

cat <<HTML > "$INDEX_FILE"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PayloadLab Sessions</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 2rem; background: #121212; color: #e0e0e0; }
    h1 { color: #ff4d4d; font-weight: 600; }
    ul { list-style: none; padding: 0; margin-top: 1.5rem; }
    li { margin: 0.5rem 0; padding: 0.5rem; border-bottom: 1px solid #333; display: flex; justify-content: space-between; align-items: center; }
    a { color: #66b2ff; text-decoration: none; }
    a:hover { text-decoration: underline; }
    .date { color: #999; font-size: 0.9rem; margin-left: 0.5rem; }
    .status { font-size: 0.8rem; padding: 0.2rem 0.5rem; border-radius: 4px; text-transform: uppercase; }
    .open { background-color: #333; color: #ffcc00; }
    .reported { background-color: #333; color: #66b2ff; }
    .resolved { background-color: #333; color: #66ff66; }
  </style>
</head>
<body>
  <h1>PayloadLab Sessions</h1>
  <ul>
HTML

if [ -f sessions.log ]; then
  tac sessions.log | while IFS=" - " read -r DATE URL STATUS; do
    STATUS_CLASS=$(echo "$STATUS" | tr '[:upper:]' '[:lower:]')
    echo "    <li><span><a href='$URL' target='_blank'>Session</a><span class='date'>$DATE</span></span><span class='status $STATUS_CLASS'>$STATUS</span></li>" >> "$INDEX_FILE"
  done
fi

cat <<HTML >> "$INDEX_FILE"
  </ul>
</body>
</html>
HTML
