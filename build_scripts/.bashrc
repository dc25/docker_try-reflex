#This script gets called from .bashrc whenever a shell starts.
# Edit to suit your own tastes.


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v=vim
alias pyser='python -m SimpleHTTPServer'
alias cdgnc='cd /repos/gitnc'
alias cdgit='cd /repos/git'

function nixextras
{
    nix-env -f "<nixpkgs>" -iA haskellPackages.ghc-mod
    nix-env -f "<nixpkgs>" -iA haskellPackages.hdevtools            
    nix-env -f "<nixpkgs>" -iA haskellPackages.hlint 
}

function rebu
{
    find . -type f -name '*.hs' | xargs ls | entr sh -c 'echo;echo;echo;echo;echo;ghcjs -DGHCJS_GC_INTERVAL=60000 Main.hs; echo done'
}



# cd /repos/gitnc/reflex-platform14-2016-12-11-cab7dd8939836a16d91b3d56405e2b6c772a2172
# cd /repos/gitnc/reflex-platform15-2017-01-05-cab7dd8939836a16d91b3d56405e2b6c772a2172
cd /repos/gitnc/reflex-platform16-2017-01-18-80a3bec3fb4d755bc40c1db6fde21fb685528ece
