{
  inputs.sandbox.url = "github:archie-judd/agent-sandbox.nix";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, sandbox, ...}:
  let
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in {
    devShells = forAllSystems (system:
      let
        pkgs = import nixpkgs {system = system;};
        copilot-sandboxed = sandbox.lib.${system}.mkSandbox {
          pkg = pkgs.github-copilot-cli;
          binName = "copilot";
          outName = "copilot";
          allowedPackages = [
            pkgs.coreutils
            pkgs.fd
            pkgs.findutils
            pkgs.git
            pkgs.gnugrep
            pkgs.gnused
            pkgs.jq
            pkgs.ripgrep
            pkgs.which
          ];
          stateDirs = [
            "$HOME/.config/github-copilot"
            "$HOME/.copilot"
          ];
          stateFiles = [];
          extraEnv = {
            # Pass secrets as shell variable references (e.g. "$TOKEN"), not
            # via builtins.getEnv, so they expand at runtime and stay out of
            # the /nix/store.
            COPILOT_GITHUB_TOKEN = "$(op read 'op://Shared with work/COPILOT_GITHUB_TOKEN/password' --account my.1password.com)";
            GIT_AUTHOR_NAME = "GitHub Copilot";
            GIT_AUTHOR_EMAIL = "copilot@github.com";
            GIT_COMMITTER_NAME = "$(git config get user.name)";
            GIT_COMMITTER_EMAIL = "$(git config get user.email)";
          };
          restrictNetwork = true;
          allowedDomains = {
            "githubcopilot.com" = "*";
            "github.com" = "*";
            "githubusercontent.com" = ["GET" "HEAD"];
          };
        };
      in {
        default = pkgs.mkShell {
          packages = [copilot-sandboxed];
        };
      }
    );
  };
}
