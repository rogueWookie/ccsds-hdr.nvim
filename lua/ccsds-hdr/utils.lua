local M = {}

local function error_handler(err)
    local message = string.format("[ccsds-hdr.utils error] %s", err)
    vim.notify(message, vim.log.levels.ERROR)
end

function M.is_valid_table_path(tbl, path)
    local success, current = xpcall(function()
        if not tbl or type(tbl) ~= "table" then
            error("Invalid argument: 'tbl' must be a table")
        end
        if not path or type(path) ~= "string" then
            error("Invalid argument: 'path' must be a string")
        end
        local current = tbl
        for key in path:gmatch("[^.]+") do
            if type(current) ~= "table" or current[key] == nil then
                error("Invalid path: Key '" .. key .. "' does not exist.")
            end
            current = current[key]
        end
        return current
    end, error_handler)
    return success, current
end

return M
