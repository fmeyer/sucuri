with import <nixpkgs> { config.allowUnfree = true; };
mkShell {
  name = "sucuri";
  nativeBuildInputs = [
   buildPackages.starship
   buildPackages.figlet
   buildPackages.lolcat
  ];
  buildInputs = with python3.pkgs; [
    pip
    setuptools
    numpy
    nltk
    pandas
    toolz
    scipy
    ipython
    notebook
    matplotlib
    pytorch
    scikitlearn
  ];
  shellHook = ''
    eval "$(starship init bash)"

    figlet "sucuri" | lolcat --freq 0.5
    echo "A scratchpad python distro for data analysis\n"
    echo "start a `jupyter notebook`"
  '';
}
