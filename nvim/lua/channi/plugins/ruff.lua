return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "ruff_format" },
        -- other formatters...
      },
      formatters = {
        ruff_format = {
          command = "ruff",
          args = { "format", "--stdin-filename", "$FILENAME", "-" },
          stdin = true,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Add debugging autocmd
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      callback = function()
        print("Attempting to format Python file...")
        local success, result = pcall(conform.format, { bufnr = 0, lsp_fallback = true })
        if success then
          print("Formatting successful")
        else
          print("Formatting failed: " .. tostring(result))
        end
      end,
    })
  end,
}
