# ccsds-hdr.nvim

A tool to encode and decode ccsds headers from neovim.

## Configuration

```lua
return {
    dir = "/Users/shaneyost/repos/ccsds-hdr.nvim",
    config = function()
        require("ccsds-hdr").setup({
            keymaps = {
                test1 = {lhs="<leader>ht1", opts={desc="test test1"}},
                test2 = {lhs="<leader>ht2", opts={desc="test test2"}},
            }
        })
    end,
}
```
