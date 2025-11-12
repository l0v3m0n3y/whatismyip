# whatismyip
api for whatismyip.net ip service site
# Example
```nim
import asyncdispatch, whatismyip, json, strutils
let data = waitFor my_ip()
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
