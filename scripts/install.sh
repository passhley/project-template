aftman install
wally install
rojo sourcemap -o sourcemap.json bundle.project.json
wally-package-types -s sourcemap.json Packages/
wally-package-types -s sourcemap.json ServerPackages/

touch Packages/_Index/osyrisrblx_t@3.0.0/t/.luaurc
echo "{
    \"languageMode\": \"nocheck\"
}" > Packages/_Index/osyrisrblx_t@3.0.0/t/.luaurc
