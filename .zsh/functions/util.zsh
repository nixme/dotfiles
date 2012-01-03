# List and search history. Without any arguments, lists the last 25 commands.
# Otherwise does a case-insensitive search of all history for the passed terms.
h() {
  if [[ "$#" -ge 1 ]]; then
    history -fD +1 | ack -i $@
  else
    history -fD -25
  fi
}

# make directory and change to it
mdc() { mkdir -p "$1" && cd "$1" }

# current date in short format, e.g. 2010.12.26
sdate() { date +%Y.%m.%d }

# pick column from stdin
pc() { awk "{print \$$1}" }

# rot13 stdin
rot13 () { tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" }

# list largest files in current directory
ducks () { 'du -cks * | sort -rn | head -11' }

# shuffle input lines. nice for playlists, etc.
shuffle() {
  RANDOM=`date +%s`
  (
  while IFS= read -r i; do
    echo $RANDOM$RANDOM "$i";
  done
  ) | sort | sed 's/^[0-9]* //'
}

# quick-convert ERB files to Haml using html2haml
h2h() {
  html2haml "$1".html.erb > "$1".html.haml && rm "$1".html.erb
}

# Optimize PNG filesize without quality loss. Depends on both pngcrush and
# optipng.
pngburn() {
  pngcrush -rem allb -brute -reduce "$1" temp.png
  optipng -o7 temp.png
  mv temp.png "$1"
}
pngburndir() {
  for png in `ls *.png`; do pngburn "$png"; done
}
