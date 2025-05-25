{
  identities = {
    userName = "aristides";
    fullName = "Aristides Gonzalez";
    githubURL = "github.com";

    personal = {
      email = "aristides@glezpol.com";
      sshPrivKey = "/home/aristides/.ssh/id_rsa";
      sshPubKey = "/home/aristides/.ssh/id_rsa.pub";
      githubHost = "github.com-personal";
      projDir = "/home/aristides/Projects/personal";
      context = "personal";
    };

    cc = {
      email = "aristides@crescentcyber.com";
      sshPrivKey = "/home/aristides/.ssh/id_rsa_crescent";
      sshPubKey = "/home/aristides/.ssh/id_rsa_crescent.pub";
      githubHost = "github.com-cc";
      projDir = "/home/aristides/Projects/cc";
      context = "cc";
    };
  };

  paths = {
    home = "/home/aristides";
    allowedSigners = "/home/aristides/.ssh/allowed_signers";
    gitHooks = "/home/aristides/.config/git/hooks";
  };
}
