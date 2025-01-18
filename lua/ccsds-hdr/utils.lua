local M = {}

function M.is_valid_table_key(tbl, key)
    for k in key:gmatch("[^.]+") do
        tbl = tbl[k]
        if tbl == nil then
            error("Invalid key: Key '" .. k .. "' does not exist.")
        end
    end
    return tbl 
end

return M
