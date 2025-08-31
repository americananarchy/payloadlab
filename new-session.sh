# 1. Create the new lab session folder + HTML
# (your existing code for that goes here)

# 2. Rebuild the sessions index
./build-index.sh

# 3. Stage ALL changes, including the new index
git add .

# 4. Commit & push
git commit -m "New lab session $DATE + updated index"
git push origin main 2>/dev/null || git push origin master 2>/dev/null

# 5. Deploy to Netlify
netlify deploy --prod --dir=.
