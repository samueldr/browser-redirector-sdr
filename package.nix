{ lib
, runCommand
, libarchive
}:

runCommand "browser-redirector-sdr" {
  version = "2025-05-15";
  nativeBuildInputs = [
    libarchive
  ];
  src = lib.cleanSource ./.;
} ''
  build_dir="$PWD"
  (
  cd $src/
  bsdtar -a -c -f "$build_dir/tmp.zip" manifest.json res/ src/
  )
  mkdir -p "$out"
  mv tmp.zip "$out/browser-redirector-sdr.$version.xpi"
''
