{ config, pkgs, ... }:

{
  programs.neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
        gopls
        ruff
        rust-analyzer
        terraform-ls
        dockerfile-language-server-nodejs
        jq-lsp
        shellcheck
        lazygit

        ripgrep
        xclip
        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [

        # Git plugins
        vim-rhubarb
        lazygit-nvim

        # {
        #   plugin = git-worktree-nvim;
        # }

        {
          plugin = gitsigns-nvim;
          config = toLuaFile ./config/nvim/plugins/gitsigns.lua;
        }

        {
          # Shows possible keybindings
          plugin = which-key-nvim;
          config = toLua "require(\"which-key\").setup()";
        }

        # Icons
        nvim-web-devicons

        {
          # Status line
          plugin = lualine-nvim;
          config = toLuaFile ./config/nvim/plugins/lualine.lua;
        }

        {
          # Color scheme
          plugin = tokyonight-nvim;
          config = "colorscheme tokyonight-night";
        }

        {
          # Code comments
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        # Alternate files navigation
        {
          plugin = harpoon;
          config = toLua "require(\"harpoon\").setup()";
        }

        # Fuzzy finder
        telescope-fzf-native-nvim

        {
          plugin = telescope-nvim;
          config = toLuaFile ./config/nvim/plugins/telescope.lua;
        }

        {
          # Indentation formatting
          plugin = indent-blankline-nvim;
          config = toLuaFile ./config/nvim/plugins/indent.lua;
        }

        # LSP
        {
          plugin = fidget-nvim;
          config = toLua "require(\"fidget\").setup()";
        }

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./config/nvim/plugins/lsp.lua;
        }

        # Code snippets
        luasnip
        friendly-snippets
        vim-nix

        # Completion
        neodev-nvim
        lspkind-nvim
        cmp_luasnip
        cmp-nvim-lsp
        cmp-path
        nvim-treesitter-parsers.typespec

        {
          plugin = nvim-cmp;
          config = toLuaFile ./config/nvim/plugins/completion.lua;
        }

        # Treesitter
        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-go
            p.tree-sitter-rego
            p.tree-sitter-tsx
            p.tree-sitter-typescript
            p.tree-sitter-yaml
          ]));
          config = toLuaFile ./config/nvim/plugins/treesitter.lua;
        }
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./config/nvim/after/autocmds.lua}
        ${builtins.readFile ./config/nvim/after/keymaps.lua}
        ${builtins.readFile ./config/nvim/after/options.lua}
        ${builtins.readFile ./config/nvim/after/telescope.lua}
        ${builtins.readFile ./config/nvim/after/diagnostics.lua}
        ${builtins.readFile ./config/nvim/after/harpoon.lua}
        ${builtins.readFile ./config/nvim/after/lazygit.lua}
      '';
    };
}
