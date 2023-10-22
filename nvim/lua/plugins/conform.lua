if true then
  return {}
end

-- setup in the extras
return {
  "stevearc/conform.nvim",
  opts = function()
    local prettier_langs =
      { "vue", "javascript", "javascriptreact", "typescript", "typescriptreact", "scss", "css", "html", "json" }

    local options = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
      },
    }

    for _, lang in ipairs(prettier_langs) do
      options.formatters_by_ft[lang] = { "prettier" }
    end
    return {
      formatters_by_ft = options.formatters_by_ft,
    }
  end,
}
