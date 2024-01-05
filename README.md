# virtualenv usage

#alias for virtualenv management are included in the shell config in nix flake configuration

alias vin="virtualenv .venv && source .venv/bin/activate"
alias vout="deactivate"
alias vclean="rm -rf .venv"
