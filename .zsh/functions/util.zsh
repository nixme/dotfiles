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
