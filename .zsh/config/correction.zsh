# correct spelling for commands only
setopt correct

# turn off correction for some [destructive] commands
for cmd (mv cp mkdir gist man) alias $cmd="nocorrect $cmd"

# automagically quote characters in URLs - much easier pasting
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
