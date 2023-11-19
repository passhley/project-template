aftman install
wally install
rojo sourcemap -o sourcemap.json bundle.project.json
wally-package-types -s sourcemap.json Packages/
wally-package-types -s sourcemap.json ServerPackages/
