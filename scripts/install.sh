aftman install
wally install
rojo sourcemap -o sourcemap.json bundle.project.json
wally-package-types -s sourcemap.json Packages/

# If you end up not having server packages, make sure to
# delete the line below this.
wally-package-types -s sourcemap.json ServerPackages/

# If you get rid of 'osyrisrblx/t', make sure to delete
# the code below this.
touch Packages/_Index/osyrisrblx_t@3.0.0/t/.luaurc
echo "{
    \"languageMode\": \"nocheck\"
}" > Packages/_Index/osyrisrblx_t@3.0.0/t/.luaurc
