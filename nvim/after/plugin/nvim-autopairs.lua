local present, autopairs = pcall(require, "nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

if not (present) then
 return
end

autopairs.setup{}
autopairs.add_rule(
  Rule("<", ">",{"vue", "typescript"})
)
