{ stdenv
, fetchFromGitHub
, fetchurl
, oh-my-zsh 
}: 

let
  fast-syntax-highlighting = fetchFromGitHub {
    owner = "zdharma";
    repo = "fast-syntax-highlighting";
    rev = "v1.55";
    sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
  };
  zsh-autosuggestions = fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-autosuggestions";
    rev = "ae315ded4dba10685dbbafbfa2ff3c1aefeb490d";
    sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
  };
  mytheme = fetchurl {
    url = "https://gitlab.com/dan4ik605743/dotfiles/-/raw/master/home/dan4ik/Documents/my.zsh-theme";
    sha256 = "1r3liynfinpk0n5b16vybnkbwwdwqnfjyqf7i82avbhrfn8gf4x6";
  };
in
  stdenv.mkDerivation {
  name = "myZsh";
  phases = [ "installPhase" ];
  src = oh-my-zsh;
  installPhase = ''
    mkdir $out/share/oh-my-zsh/custom/plugins/{zsh-autosuggestions,fast-syntax-highlighting} $out/share/oh-my-zsh/themes -p
    cp ${fast-syntax-highlighting}/* $out/share/oh-my-zsh/custom/plugins/fast-syntax-highlighting -r
    cp ${zsh-autosuggestions}/* $out/share/oh-my-zsh/custom/plugins/zsh-autosuggestions -r
    cp ${mytheme} $out/share/oh-my-zsh/themes/my.zsh-theme
    cp $src/* $out -r
  '';
}
