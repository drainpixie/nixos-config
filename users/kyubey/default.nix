{ pkgs, inputs, home-manager, ... }: {
  imports = [ ./borg.nix ./jellyfin.nix ./minecraft.nix ./tailscale.nix ];
  nix.settings.trusted-users = [ "kyubey" ];

  users.users.kyubey = {
    uid = 1000;
    home = "/home/kyubey";

    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "changeme";

    extraGroups = [ "wheel" "networkmanager" "minecraft" ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFHNQwE4WjjUdFpJ+5XhKJSUY0WBO5OWA5ww1G48/Eab/oJpAzP68tKtT7PRHL3uXp/9xDs6dR20GLfF9xJa48TDWE2tYvtdG5TUK6IcfSYIgLw2mh6pJTc0Z97kM17Gu9snm0IHj15szXK2uovly06xd4HccIJV2e9VlvFh5AJaZ4tEqDhUU099nSNM6/Czp9nSuq/VAjNTu9iV5Vh12zOKWF/OvH5Q0tpKjBqURV/vOsJ9W8c+5KVmnDYTxKq/4zNLeyRJ25WlSSbsfVYxcoXLxnTlE5lyLabqgmOz3a9//rtnb8SUGvgWgkKbeCI/tYCO2JIt27SHgnao4CO+ZeL/L9GsyNgOnf7zr1aeSrOz4MNRdVBClwDTl0qQ3XKnJDw6n2v1TPOQrq67aPjoQl6AGsvnZXg68OOqJ+5Zgp0eRlUPiySHSY62cmMSEuER81INKsElLE60rYH3Pxt4ekm+FrmhDgvMXoHrt6VpUX6HNiXMcN8q/fVnto8i+D0Mc="
    ];
  };

  home-manager.users.kyubey = {
    home = {
      stateVersion = "24.05";
      file.".hushlogin".text = "";

      packages = with pkgs; [
        htop
        tmux
        aria2

        man-pages
        man-pages-posix
      ];

      sessionVariables = { } // import ../../common/session.nix;
    };

    programs = { } // import ../../common/bash.nix;
  };
}
