{ pkgs, ... }: {
  packages = [ pkgs.git ];

  languages = {
    java = {
      enable = true;
      jdk.package = pkgs.jdk21;
      maven.enable = true;
    };
    shell.enable = true;
    javascript.enable = true;
    typescript.enable = true;
    nix.enable = true;
  };

  services.postgres = {
    enable = true;
    package = pkgs.postgresql;
    listen_addresses = "127.0.0.1";
    initialDatabases = [{ name = "shsponsors_db"; }];
  };

  devcontainer.enable = true;
  difftastic.enable = true;
  dotenv.enable = true;

  pre-commit.hooks = {
    actionlint.enable = true;
    commitizen.enable = true;
    markdownlint.enable = true;
  };
}
