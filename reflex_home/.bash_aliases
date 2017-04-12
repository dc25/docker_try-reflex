#This script gets called from .bashrc whenever a shell starts.
# Edit to suit your own tastes.


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v=vim
alias pyser='python -m SimpleHTTPServer'

function nixextras
{
    nix-env -f "<nixpkgs>" -iA haskellPackages.ghc-mod
    nix-env -f "<nixpkgs>" -iA haskellPackages.hdevtools            
    nix-env -f "<nixpkgs>" -iA haskellPackages.hlint 
}

