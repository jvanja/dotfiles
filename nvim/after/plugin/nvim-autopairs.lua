local autopairs = pcall(require, "nvim-autopairs")

if not (autopairs) then
 return
end

require("nvim-autopairs").setup{}
