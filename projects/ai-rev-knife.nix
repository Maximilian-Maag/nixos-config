{ config, lib, pkgs, ... }:

let
  # Define the custom derivation for Tree-sitter parsers
  treeSitterParsers = pkgs.stdenv.mkDerivation rec {
    pname = "tree-sitter-parsers";
    version = "1.0";

    # Fetch sources for each parser from GitHub (replace sha256 with actual hash)
    srcC = pkgs.fetchFromGitHub {
      owner = "tree-sitter";
      repo = "tree-sitter-c";
      rev = "refs/heads/master";
      sha256 = "1bzpcka7k8idh28fzkhnhnqjxav41db7dba5fmvx8l3n1nb1v3cb";
    };

    srcCSharp = pkgs.fetchFromGitHub {
      owner = "tree-sitter";
      repo = "tree-sitter-c-sharp";
      rev = "refs/heads/master";
      sha256 = "0pwpynwkrr4lgjsgskw0zhbcakx4qzx688fl21v7c701pqz83314";  # Replace with actual sha256
    };

    srcJS = pkgs.fetchFromGitHub {
      owner = "tree-sitter";
      repo = "tree-sitter-javascript";
      rev = "refs/heads/master";
      sha256 = "0grm51ap493kc5xp8hwrbmbd27a2f27igmysshqa3kzagqsx7xpr";  # Replace with actual sha256
    };

    srcJava = pkgs.fetchFromGitHub {
      owner = "tree-sitter";
      repo = "tree-sitter-java";
      rev = "refs/heads/master";
      sha256 = "00w4d34rgl52blkx7x1jz4cj9d272ncljicjgdyvbchy1m2qg1jy";  # Replace with actual sha256
    };

    buildInputs = [
      pkgs.nodejs
      pkgs.tree-sitter  # Ensure the tree-sitter CLI is available
      pkgs.gcc
      pkgs.gnumake
      pkgs.git
    ];

    installPhase = ''
      mkdir -p $out/{lib,include}

      # Build and install parsers (C, C#, JavaScript, Java)
      cd ${srcC}
      tree-sitter generate
      cp src/parser.c $out/lib/tree-sitter-c-parser.c
      cp src/parser.h $out/include/tree-sitter-c-parser.h

      cd ${srcCSharp}
      tree-sitter generate
      cp src/parser.c $out/lib/tree-sitter-csharp-parser.c
      cp src/parser.h $out/include/tree-sitter-csharp-parser.h

      cd ${srcJS}
      tree-sitter generate
      cp src/parser.c $out/lib/tree-sitter-javascript-parser.c
      cp src/parser.h $out/include/tree-sitter-javascript-parser.h

      cd ${srcJava}
      tree-sitter generate
      cp src/parser.c $out/lib/tree-sitter-java-parser.c
      cp src/parser.h $out/include/tree-sitter-java-parser.h
    '';

    meta = with lib; {
      description = "Tree-sitter parsers for C, C#, JavaScript, and Java";
      license = licenses.mit;
    };
  };
in

{
  # Ensure Tree-sitter and the parsers are installed
  environment.systemPackages = with pkgs; [
    pkgs.tree-sitter  # Install Tree-sitter CLI globally
    treeSitterParsers      # Install the Tree-sitter parsers
  ];

  # Optionally, you can add other configurations or services here
}
