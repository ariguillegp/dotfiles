{ pkgs, identities, paths, ... }:

{
  home.file.".ssh/allowed_signers".text = ''
    ${identities.personal.email} ${builtins.readFile identities.personal.sshPubKey}
    ${identities.cc.email} ${builtins.readFile identities.cc.sshPubKey}
  '';

  programs.git = {
    enable = true;
    userName = "${identities.fullName}";
    userEmail = "${identities.personal.email}";

    includes = [
      {
        condition = "gitdir:${identities.personal.projDir}/**";
        contents = {
          user.email = "${identities.personal.email}";
          user.signingkey = "${identities.personal.sshPubKey}";
        };
      }
      {
        condition = "gitdir:${identities.cc.projDir}/**";
        contents = {
          user.email = "${identities.cc.email}";
          user.signingkey = "${identities.cc.sshPubKey}";
        };
      }
    ];

    # git extension for versioning large files
    lfs.enable = true;

    extraConfig = {
      init = { defaultBranch = "main"; };
      core.editor = "nvim";
      # core.hooksPath = "${paths.gitHooks}";
      pull.rebase = "true";
      fetch.prune = true;      # Remove remote-tracking branches that no longer exist
      fetch.fsckObjects = true;
      rebase.autoStash = true; # Automatically stash/unstash when rebasing
      transfer.fsckObjects = true;
      receive.fsckObjects = true;
      diff.algorithm = "patience";
      merge.conflictStyle = "diff3";
      push.default = "upstream";
      push.followTags = true;  # Push tags along with commits
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "${paths.allowedSigners}";
      user.signingkey = "${identities.personal.sshPubKey}";

      alias = {
        # Quick identity check
        whoami = "!git config user.name && git config user.email && git config user.signingkey";

        # Show current repo's Git config
        config-local = "config --local --list";

        # Better aliases for signature verification
        sig-head = "verify-commit HEAD";
        sig-log = "log --show-signature --oneline -10";
        sig-status = "log --pretty=format:'%h %G? %aN %s' -10";
        sig-test = "!git commit --allow-empty -m 'test: Test commit signature' && git verify-commit HEAD";

        # Streamlined repo creation for heavy worktree usage
        clone-worktree = "!git-clone-worktree";
      };
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        syntax-theme = "ansi";
      };
    };

    ignores = [
      "*.bak"
      "*.gho"
      "*.ori"
      "*.orig"
      "*.tmp"
      "*.patch"
      "*.diff"
      "secring.*"

      # temporary files which can be created if a process still has a handle open of a deleted file
      ".fuse_hidden*"

      # KDE directory preferences
      ".directory"

      # Linux trash folder which might appear on any partition or disk
      ".Trash-*"

      # .nfs files are created when an open file is removed but is still being accessed
      ".nfs*"

      # Swap
      "[._]*.s[a-v][a-z]"
      "!*.svg" # comment out if you don't need vector files
      "[._]*.sw[a-p]"
      "[._]s[a-rt-v][a-z]"
      "[._]ss[a-gi-z]"
      "[._]sw[a-p]"

      # Session
      "Session.vim"
      "Sessionx.vim"

      # Temporary
      ".netrwhist"
      "*~"
      # Auto-generated tag files
      "tags"
      # Persistent undo
      "[._]*.un~"

      # General
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"

      # Icon must end with two \r
      "Icon"

      # Thumbnails
      "._*"

      # Files that might appear in the root of a volume
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"

      # Directories potentially created on remote AFP share
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"

      # If you prefer the allow list template instead of the deny list, see community template:
      # https://github.com/github/gitignore/blob/main/community/Golang/Go.AllowList.gitignore
      #
      # Binaries for programs and plugins
      "*.exe"
      "*.exe~"
      "*.dll"
      "*.so"
      "*.dylib"

      # Test binary, built with `go test -c`
      "*.test"

      # Output of the go coverage tool, specifically when used with LiteIDE
      "*.out"

      # Dependency directories (remove the comment below to include it)
      # vendor/

      # Go workspace file
      "go.work"

      # Compiled Lua sources
      "luac.out"

      # luarocks build files
      "*.src.rock"
      "*.zip"
      "*.tar.gz"

      # Object files
      "*.o"
      "*.os"
      "*.ko"
      "*.obj"
      "*.elf"

      # Precompiled Headers
      "*.gch"
      "*.pch"

      # Libraries
      "*.lib"
      "*.a"
      "*.la"
      "*.lo"
      "*.def"
      "*.exp"

      # Shared objects (inc. Windows DLLs)
      "*.dll"
      "*.so"
      "*.so.*"
      "*.dylib"

      # Executables
      "*.exe"
      "*.out"
      "*.app"
      "*.i*86"
      "*.x86_64"
      "*.hex"

      "_build"
      "_tracks"
      "opa-debug-js"

      "*.opp"
      "*.opx"
      "*.opx.broken"
      "*.dump"
      "*.api"
      "*.api-txt"
      "*.exe"
      "*.log"

      # Local .terraform directories
      "**/.terraform/*"

      # .tfstate files
      "*.tfstate"
      "*.tfstate.*"

      # Crash log files
      "crash.log"
      "crash.*.log"

      # Exclude all .tfvars files, which are likely to contain sensitive data, such as
      # password, private keys, and other secrets. These should not be part of version
      # control as they are data points which are potentially sensitive and subject
      # to change depending on the environment.
      "*.tfvars"
      "*.tfvars.json"

      # Ignore override files as they are usually used to override resources locally and so
      # are not checked in
      "override.tf"
      "override.tf.json"
      "*_override.tf"
      "*_override.tf.json"

      # Include override files you do wish to add to version control using negated pattern
      # !example_override.tf

      # Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
      # example: *tfplan*

      # Ignore CLI configuration files
      ".terraformrc"
      "terraform.rc"

      # Generated by Cargo
      # will have compiled files and executables
      "debug/"
      "target/"

      # Remove Cargo.lock from gitignore if creating an executable, leave it for libraries
      # More information here https://doc.rust-lang.org/cargo/guide/cargo-toml-vs-cargo-lock.html
      "Cargo.lock"

      # These are backup files generated by rustfmt
      "**/*.rs.bk"

      # MSVC Windows builds of rustc generate these, which store debugging information
      "*.pdb"

      # Byte-compiled / optimized / DLL files
      "__pycache__/"
      "*.py[cod]"
      "*$py.class"

      # C extensions
      "*.so"

      # Distribution / packaging
      ".Python"
      "build/"
      "develop-eggs/"
      "dist/"
      "downloads/"
      "eggs/"
      ".eggs/"
      "lib/"
      "lib64/"
      "parts/"
      "sdist/"
      "var/"
      "wheels/"
      "share/python-wheels/"
      "*.egg-info/"
      ".installed.cfg"
      "*.egg"
      "MANIFEST"

      # PyInstaller
      #  Usually these files are written by a python script from a template
      #  before PyInstaller builds the exe, so as to inject date/other infos into it.
      "*.manifest"
      "*.spec"

      # Installer logs
      "pip-log.txt"
      "pip-delete-this-directory.txt"

      # Unit test / coverage reports
      "htmlcov/"
      ".tox/"
      ".nox/"
      ".coverage"
      ".coverage.*"
      ".cache"
      "nosetests.xml"
      "coverage.xml"
      "*.cover"
      "*.py,cover"
      ".hypothesis/"
      ".pytest_cache/"
      "cover/"

      # Translations
      "*.mo"
      "*.pot"

      # Django stuff:
      "*.log"
      "local_settings.py"
      "db.sqlite3"
      "db.sqlite3-journal"

      # Flask stuff:
      "instance/"
      ".webassets-cache"

      # Scrapy stuff:
      ".scrapy"

      # Sphinx documentation
      "docs/_build/"

      # PyBuilder
      ".pybuilder/"
      "target/"

      # Jupyter Notebook
      ".ipynb_checkpoints"

      # IPython
      "profile_default/"
      "ipython_config.py"

      # pyenv
      #   For a library or package, you might want to ignore these files since the code is
      #   intended to run in multiple environments; otherwise, check them in:
      # .python-version

      # pipenv
      #   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
      #   However, in case of collaboration, if having platform-specific dependencies or dependencies
      #   having no cross-platform support, pipenv may install dependencies that don't work, or not
      #   install all needed dependencies.
      #Pipfile.lock

      # poetry
      #   Similar to Pipfile.lock, it is generally recommended to include poetry.lock in version control.
      #   This is especially recommended for binary packages to ensure reproducibility, and is more
      #   commonly ignored for libraries.
      #   https://python-poetry.org/docs/basic-usage/#commit-your-poetrylock-file-to-version-control
      #poetry.lock

      # pdm
      #   Similar to Pipfile.lock, it is generally recommended to include pdm.lock in version control.
      #pdm.lock
      #   pdm stores project-wide configurations in .pdm.toml, but it is recommended to not include it
      #   in version control.
      #   https://pdm.fming.dev/#use-with-ide
      ".pdm.toml"

      # PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
      "__pypackages__/"

      # Celery stuff
      "celerybeat-schedule"
      "celerybeat.pid"

      # SageMath parsed files
      "*.sage.py"

      # Environments
      ".env"
      ".venv"
      "env/"
      "venv/"
      "ENV/"
      "env.bak/"
      "venv.bak/"

      # Spyder project settings
      ".spyderproject"
      ".spyproject"

      # Rope project settings
      ".ropeproject"

      # mkdocs documentation
      "/site"

      # mypy
      ".mypy_cache/"
      ".dmypy.json"
      "dmypy.json"

      # Pyre type checker
      ".pyre/"

      # pytype static type analyzer
      ".pytype/"

      # Cython debug symbols
      "cython_debug/"

      # PyCharm
      #  JetBrains specific template is maintained in a separate JetBrains.gitignore that can
      #  be found at https://github.com/github/gitignore/blob/main/Global/JetBrains.gitignore
      #  and can be added to the global gitignore or merged into this file.  For a more nuclear
      #  option (not recommended) you can uncomment the following to ignore the entire idea folder.
      #.idea/
    ];
  };
}
