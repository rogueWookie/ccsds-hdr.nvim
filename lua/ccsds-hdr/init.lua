local conf = require("ccsds-hdr.config")
local M = {}

function M.setup(user_cfg)
    conf.setup(user_cfg)
end

function M.test1() print("test1()") end
function M.test2() print("test2()") end

return M
