{ pkgs, identities, ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "${identities.personal.githubHost}" = {
        hostname = "${identities.githubURL}";
        user = "git";
        identityFile = "${identities.personal.sshPrivKey}";
        identitiesOnly = true;
      };

      "${identities.cc.githubHost}" = {
        hostname = "${identities.githubURL}";
        user = "git";
        identityFile = "${identities.cc.sshPrivKey}";
        identitiesOnly = true;
      };
    };
  };
}
