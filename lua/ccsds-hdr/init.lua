local config = require("ccsds-hdr.config")
local M = {}

function M.setup(user_cfg)
    -- Merge the user's config w/ our default so we get their preferences
    config.set_config(user_cfg)

    -- Initialize all keymaps now that our config has been updated
    local maps = config.get_keymap()
    config.set_keymap(maps.test1.mode, maps.test1.lhs, M.test1, maps.test1.opts)
    config.set_keymap(maps.test2.mode, maps.test2.lhs, M.test2, maps.test2.opts)
end

function M.test1()
    print("Hello from test1()")
end

function M.test2()
    print("Hello from test2()")
end

return M
