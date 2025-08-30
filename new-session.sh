#!/bin/bash
# === PayloadLab Auto-Lab + Deploy ===
DATE=$(date +%Y-%m-%d_%H-%M-%S)
FOLDER="lab/session-$DATE"

# 1. Make new session folder
mkdir -p "$FOLDER"

# 2. Create basic HTML page
cat <<HTML > "$FOLDER/index.html"
<!DOCTYPE html>
<html>
<head>
  <title>PayloadLab Session $DATE</title>
</head>
<body>
  <h1>PayloadLab Session - $DATE</h1>
  <p>Sandbox page for in-scope testing.</p>
</body>
</html>
HTML

# 3. Git commit & push
git add .
git commit -m "New lab session $DATE"
git push origin main || git push origin master

# 4. Trigger Netlify deploy
netlify deploy --prod --dir=.
