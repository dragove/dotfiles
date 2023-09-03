return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "windwp/nvim-ts-autotag" }
    },
    cmd = { "TSUpdateSync" },
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash", "c", "c_sharp", "clojure", "cmake", "comment", "commonlisp", "cpp", "css", "cuda", "d", "dart",
                "diff", "dockerfile", "dot", "elixir", "elm", "erlang", "fennel", "fish", "git_config", "git_rebase",
                "gitattributes", "gitcommit", "gitignore", "go", "gomod", "gosum", "gowork", "graphql", "groovy", "hare",
                "haskell_persistent", "html", "http", "ini", "java", "javascript", "jq", "jsdoc", "json", "json5",
                "jsonc", "julia", "kotlin", "latex", "llvm", "lua", "luadoc", "luap", "luau", "make", "markdown",
                "meson", "ninja", "nix", "norg", "ocaml", "ocamllex", "odin", "perl", "php", "phpdoc", "python", "query",
                "r", "regex", "ruby", "rust", "scala", "scss", "sql", "tsx", "typescript", "vue", "yaml", "yuck", "zig",
                "svelte"
            },
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false
            },
            autotag = {
                enable = true,
            },
        })
        vim.cmd [[
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
        ]]
    end
}
