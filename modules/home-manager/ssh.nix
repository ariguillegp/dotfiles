{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com-personal" = {
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa";
        identitiesOnly = true; # Direct option, not nested in 'data'
      };

      "github.com-cc" = {
        hostName = "github.com";
        user = "git";
        identityFile = "~/.ssh/crescent_rsa";
        identitiesOnly = true; # Direct option, not nested in 'data'
      };
    };
  };
}
