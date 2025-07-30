let
  shizuru = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBImavlF/DsHe1Gi3Mt8qF8leWcOCINhghNoYf1FNz+j";
in {
  "private.age".publicKeys = [shizuru];
}
