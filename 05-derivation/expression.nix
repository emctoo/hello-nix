derivation {
  builder = ./builder.sh;
  src = ./hello.sh;
  name = "hello-1.0";
  system = "x86_64-linux";
  cp = ./busybox_CP;
}
