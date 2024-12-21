{ lib, stdenv, fetchurl, nodePackages, ... }:

stdenv.mkDerivation rec {
  pname = "angular-cli";
  version = "19.0.0";  # Specify Angular CLI version 19

  # Fetch the Angular CLI tarball from the npm registry
  src = fetchurl {
    url = "https://registry.npmjs.org/@angular/cli/-/cli-${version}.tgz";
    sha256 = "097nn3xd48pi1v7igxvkqqrjkd47v2rb2smyz4ylp2apxbpxqib1";  # Replace this with the actual sha256 hash
  };

  # Build dependencies: Node.js environment and npm
  nativeBuildInputs = [ nodePackages.nodejs ];

   buildPhase = ''
    # Unpack the tarball into a temporary directory
    mkdir -p $TMPDIR/angular-cli
    tar -xzvf $src -C $TMPDIR/angular-cli

    # Make sure the package.json is in the expected location
    cd $TMPDIR/angular-cli/package

    # Install dependencies and build the package
    npm install --prefix $TMPDIR/angular-cli/package
    npm run build --prefix $TMPDIR/angular-cli/package
  '';

  installPhase = ''
    # Ensure the necessary directories exist in the output path
    mkdir -p $out/lib/node_modules
    cp -r $TMPDIR/angular-cli/package $out/lib/node_modules/

    # Create symlinks for binaries in $out/bin
    ln -s $out/lib/node_modules/angular-cli/bin/angular-cli.js $out/bin/angular-cli
  '';
  meta = with lib; {
    description = "Angular CLI version 19";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
