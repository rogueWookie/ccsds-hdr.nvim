-- NOTE 
-- To run tests in this file ...
-- lua require("plenary.test_harness").test_file("tests/test_ccsds.lua")

describe("ccsds", function()
    it("can be required", function()
        require("ccsds-hdr")
    end)
    it("can call test1", function()
        require("ccsds-hdr").test1()
    end)
    it("can call test2", function()
        require("ccsds-hdr").test2()
    end)
end)
