local M = {}

M.config = {
    keymaps = {
        test1 = {mode="n", lhs="<leader>ht1", opts={desc="test1"}},
        test2 = {mode="n", lhs="<leader>ht2", opts={desc="test2"}},
    }
}

function M.set_keymap(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    options = vim.tbl_extend("force", options, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

function M.get_keymap()
    return M.config.keymaps
end

function M.set_config(cfg)
    M.config = vim.tbl_deep_extend("force", M.config, cfg or {})
end

function M.get_config()
    return M.config
end

return M
