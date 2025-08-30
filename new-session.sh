#!/bin/bash
DATE=$(date +%Y-%m-%d)
FOLDER="lab/session-$DATE"
mkdir -p "$FOLDER"
cat <<HTML > "$FOLDER/index.html"
<!DOCTYPE html>
<html>
<head><title>PayloadLab Session $DATE</title></head>
<body>
<h1>PayloadLab Session - $DATE</h1>
<p>Sandbox page for in-scope testing.</p>
</body>
</html>
HTML
echo "Created $FOLDER"
