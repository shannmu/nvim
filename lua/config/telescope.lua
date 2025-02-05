require("telescope").setup({
  pickers = {
    buffers = {
      sort_lastused = true, -- 按最近使用排序
      ignore_current_buffer = true, -- 不显示当前 Buffer
      mappings = {
        i = {
          ["<C-d>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            -- 刷新 Telescope 界面，而不是关闭
            require("telescope.actions").delete_buffer(prompt_bufnr) -- 让 Telescope 处理 Buffer 删除
            ---vim.api.nvim_buf_delete(selection.bufnr, { force = false }) -- 关闭 Buffer
            current_picker:refresh() -- 刷新 Buffer 列表
          end,
        },
        n = {
          ["<C-d>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            require("telescope.actions").delete_buffer(prompt_bufnr)
            ---vim.api.nvim_buf_delete(selection.bufnr, { force = false }) -- 关闭 Buffer
            current_picker:refresh() -- 刷新 Buffer 列表
          end,
        },
      },
    },
  },
})

