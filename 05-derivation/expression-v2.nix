let
  fetchurl = import <nix/fetchurl.nix>;
in derivation {
  builder = ./builder.sh;
  src = ./hello.sh;
  name = "hello-1.0";
  system = "x86_64-linux";
  cp = fetchurl {
    url = "https://www.busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_CP";
    sha256 = "0mq1487x7aaz89211wrc810k9d51nsfi7jwfy56lg3p20m54r22a";
    executable = true;
  };
  chmod = fetchurl {
    url = "https://www.busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_CHMOD";
    sha256 = "06fp9hqf0cxjqvs9hjg5n81lm5yhkp6iwiaa74j4cfg0wbf7d8fc";
    executable = true;
  };
}
