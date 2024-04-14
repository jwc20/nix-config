{pkgs}:

# pkgs.writeShellScriptBin "my-awesome-script" ''
#   #!${pkgs.bash}/bin/bash
#   echo "Hello, world!"
# ''

pkgs.writeShellScriptBin "my-awesome-script" ''
  echo "hello, world!" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
''
