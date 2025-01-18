local utils = require("ccsds-hdr.utils")
local M = {}

M.cfg = {
    keymaps = {
        test1 = {
            mode="n", lhs="<leader>ht1", opts={
                desc="ccsds-hdr test1"
            }
        },
        test2 = {
            mode="n", lhs="<leader>ht2", opts={
                desc="ccsds-hdr test2"
            }
        },
    }
}

-- keymap functions
function M.get_map(mode, lhs, rhs, opts) end
function M.set_map(mode, lhs, rhs, opts) end

-- config functions 
function M.get(key)
    assert(type(key) == "string", "Invalid argument: 'key' must be a string")
    return utils.is_valid_table_key(M.cfg, key)
end

function M.mrg(cfg)
    assert(type(cfg) == "table", "Invalid argument: 'cfg' must be a table")
    M.cfg = vim.tbl_deep_extend("force", M.cfg, cfg or {})
    return M.cfg
end

-- module config function
function M.setup(user_config)
    -- extend our config w/ users
    M.mrg(user_config)
    -- setup key maps
end

return M
