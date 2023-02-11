local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  highlight = {
    ensure_installed = {
      "lua",
      "bash",
      "markdown",
      "markdown_inline",
      "regex",
      "rust",
      "go",
      "html",
      "vim",
      "help",
      "java",
      "javascript",
      "tsx",
      "typescript",
      "yaml",
      "toml"
    },
    enable = true,
    use_languagetree = true,
    disable = { "org" },
    additional_vim_regex_highlighting = { "org" },
  },
  indent = {
    enable = true,
  },
}

