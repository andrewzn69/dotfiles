## ZSHRC
## andrewzn's zsh config
## https://github.com/andrewzn69

while read file
do
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
aliases
env
options
prompt
secrets
zinit
EOF
