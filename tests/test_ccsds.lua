-- NOTE 
-- lua require("plenary.test_harness").test_file("tests/test_ccsds.lua")

describe("utils.is_valid_table_path", function()
    local utils = require("ccsds-hdr.utils")
    local config = require("ccsds-hdr.config")
    it("should return true and the resolved value for a valid path", function()
        local success, value = utils.is_valid_table_path(config.cfg, "keymaps.test1")
        assert.is_true(success)
        assert.are.same("n", value.mode)
        assert.are.same("<leader>ht1", value.lhs)
    end)
    it("should return false and nil for an invalid path", function()
        local success, value = utils.is_valid_table_path(config.cfg, "keymaps.test3")
        assert.is_false(success)
        assert.is_nil(value)
    end)
    it("should return false because cfg is not a table", function()
        local success, value = utils.is_valid_table_path("foo", "keymaps.test1")
        assert.is_false(success)
        assert.is_nil(value)
    end)
end)

describe("config.get", function()
    local config = require("ccsds-hdr.config")
    it("should return a valid table based on key", function()
        assert.are.same(config.cfg.keymaps, config.get("keymaps"))
        assert.are.same(config.cfg.keymaps.test1, config.get("keymaps.test1"))
        assert.are.same(config.cfg.keymaps.test1.lhs, config.get("keymaps.test1.lhs"))
    end)
    it("should return empty table when key is invalid", function()
        assert.are.same({}, config.get("foobar"))
        assert.are.same({}, config.get("keymaps.test3"))
    end)
end)

describe("config.mrg", function()
    local config = require("ccsds-hdr.config")
    it("should override mode to i in test1", function()
        local user_cfg = {
            keymaps = {
                test1 = {mode = "i"}
            }
        }
        config.mrg(user_cfg)
        assert.are.same(config.cfg.keymaps.test1.mode, user_cfg.keymaps.test1.mode)
    end)
    it("should add another key to keymaps", function()
        local user_cfg = {
            keymaps = {
                test3 = {
                    mode = "i"
                }
            }
        }
        config.mrg(user_cfg)
        assert.are.same(config.cfg.keymaps.test3, user_cfg.keymaps.test3) 
    end)
    it("should fail because of invalid type passed", function()
        assert.has_error(function()
            config.mrg("foo")
        end, "Invalid argument: 'cfg' must be a table")
    end)
end)
