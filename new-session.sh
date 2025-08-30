#!/bin/bash
# === PayloadLab Auto-Lab + Auto-Deploy (No Errors) ===
DATE=$(date +%Y-%m-%d_%H-%M-%S)
FOLDER="lab/session-$DATE"
DOMAIN="payloadlab1.netlify.app"   # Change to your custom domain when ready

# 0. Sync with GitHub to avoid push conflicts
git pull --rebase origin main 2>/dev/null || git pull --rebase origin master 2>/dev/null

# 1. Make new session folder
mkdir -p "$FOLDER"

# 2. Create styled HTML page
cat <<HTML > "$FOLDER/index.html"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PayloadLab Session $DATE</title>
  <style>
    body { font-family: sans-serif; margin: 2rem; background: #0d0d0d; color: #f5f5f5; }
    h1 { color: #ff4d4d; }
    .notes { margin-top: 2rem; padding: 1rem; background: #1a1a1a; border-radius: 8px; }
  </style>
</head>
<body>
  <h1>PayloadLab Session - $DATE</h1>
  <p>Sandbox page for in-scope testing.</p>
  <div class="notes">
    <h2>Notes</h2>
    <ul>
      <li>Input points:</li>
      <li>Observed behavior:</li>
      <li>Potential chain ideas:</li>
    </ul>
  </div>
</body>
</html>
HTML

# 3. Commit & push
git add .
git commit -m "New lab session $DATE"
git push origin main 2>/dev/null || git push origin master 2>/dev/null

# 4. Deploy to Netlify
DEPLOY_URL=$(netlify deploy --prod --dir=. | grep "Website URL:" | awk '{print $3}')

# 5. Log the session URL
SESSION_URL="https://$DOMAIN/$FOLDER/"
echo "$DATE - $SESSION_URL" >> sessions.log

# 6. Open in mobile browser (Termux)
termux-open-url "$SESSION_URL"

echo "🚀 New lab session live at: $SESSION_URL"
