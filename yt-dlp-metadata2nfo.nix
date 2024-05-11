{ python3Packages, makeWrapper,... }:

python3Packages.buildPythonPackage {
  pname = "metadata2nfo";
  version = "20240511";
  format = "pyproject";
  src = ./.;
  buildInputs = [ makeWrapper ];
  propagatedBuildInputs = with python3Packages; [
    loguru
    python-dotenv
    poetry-core
  ];
  postInstall = ''

    wrapProgram $out/bin/start --set ENVIRONMENT debug --set TARGET_PATH .
    mv -v $out/bin/start $out/bin/metadata2nfo
    '';
}
