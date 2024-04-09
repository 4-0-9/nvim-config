return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "danymat/neogen",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enabled = true,
            input_after_comment = true,
            languages = {
                cs = {
                    template = {
                        annotation_convention = "xmldoc"
                    }
                }
            }
        },
        keys = {
            {
                "<leader>nf",
                ":Neogen func<CR>",
                desc = "Document function"
            },
            {
                "<leader>nt",
                ":Neogen type<CR>",
                desc = "Document type"
            },
            {
                "<leader>nc",
                ":Neogen class<CR>",
                desc = "Document class"
            },
            {
                "<C-k>",
                function()
                    require("neogen").jump_next()
                end,
                mode = "i",
                desc = "Next documentation field"
            },
            {
                "<C-j>",
                function()
                    require("neogen").jump_prev()
                end,
                mode = "i",
                desc = "Previous documentation field"
            },
        }
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
