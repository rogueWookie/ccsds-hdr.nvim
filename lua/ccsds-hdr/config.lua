local utils = require("ccsds-hdr.utils")
local M = {}

M.cfg = {
    keymaps = {
        test1 = {mode="n", lhs="<leader>ht1", opts={desc="ccsds-hdr test1"}},
        test2 = {mode="n", lhs="<leader>ht2", opts={desc="ccsds-hdr test2"}},
    }
}

-- keymap functions
function M.get_map(mode, lhs, rhs, opts) end
function M.set_map(mode, lhs, rhs, opts) end

-- config functions 
function M.get(key)
    local success, value = utils.is_valid_table_path(M.cfg, key)
    if success then
        return value
    else
        return {}
    end
end

function M.mrg(cfg)
    if not cfg or type(cfg) ~= "table" then
        error("Invalid argument: 'cfg' must be a table")
    end
    M.cfg = vim.tbl_deep_extend("force", M.cfg, cfg or {})
end

function M.set(key, val)
end

-- module config function
function M.setup(user_config) end

return M
