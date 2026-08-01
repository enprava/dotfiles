-- ASCII Startup window

-- Deactivate numbers for this window
vim.opt_local.number = false
vim.opt_local.relativenumber = false

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" and vim.bo.filetype == "" then
      
      local ms = math.floor((vim.uv.hrtime() - vim.g.startup_start) / 1e6)

      local logo = {
        "  _   _ _____ _____     _____ __  __ ",
        " | \\ | | ____/ _ \\ \\   / /_ _|  \\/  |",
        " |  \\| |  _|| | | \\ \\ / / | || |\\/| |",
        " | |\\  | |__| |_| |\\ V /  | || |  | |",
        " |_| \\_|_____\\___/  \\_/  |___|_|  |_|",
        " ",
        string.format("         Neovim loaded in %d ms", ms),
      }

      local buf = vim.api.nvim_get_current_buf()

      local logo_width = 0
      for _, line in ipairs(logo) do
        logo_width = math.max(logo_width, #line)
      end

      local pad_x = math.max(0, math.floor((vim.api.nvim_win_get_width(0) - logo_width) / 2))
      local pad_y = math.max(0, math.floor((vim.api.nvim_win_get_height(0) - #logo) / 2))

      local lines = {}
      for _ = 1, pad_y do
        lines[#lines + 1] = ""
      end
      for _, line in ipairs(logo) do
        lines[#lines + 1] = string.rep(" ", pad_x) .. line
      end

      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

      vim.bo[buf].modifiable = false
      vim.bo[buf].modified = false
      vim.bo[buf].buftype = "nofile"
      vim.bo[buf].bufhidden = "wipe"

      local clear_logo
      clear_logo = vim.api.nvim_create_autocmd("InsertEnter", {
        buffer = buf,
        callback = function()
          vim.bo[buf].modifiable = true
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
          vim.bo[buf].buftype = ""
          vim.api.nvim_del_autocmd(clear_logo)
        end,
      })
    end
  end,
 })
