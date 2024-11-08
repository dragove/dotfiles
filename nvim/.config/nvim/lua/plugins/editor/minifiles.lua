-- some code are copied from https://github.com/mrjones2014/dotfiles/blob/master/nvim/lua/my/configure/mini_files.lua
return {
  "echasnovski/mini.files",
  version = "*",
  keys = {
    {
      "<leader>e",
      function()
        local minifiles = require("mini.files")
        if vim.bo.ft == "minifiles" then
          minifiles.close()
        else
          local file = vim.api.nvim_buf_get_name(0)
          local file_exists = vim.fn.filereadable(file) ~= 0
          minifiles.open(file_exists and file or nil)
          minifiles.reveal_cwd()
        end
      end,
      { desc = "Open current directory" },
    },
    { "<leader>we", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open working directory" } },
  },
  opts = {
    content = {
      filter = function(entry)
        return entry.name ~= ".git"
      end,
      sort = function(entries)
        local all_paths = table.concat(
          vim
            .iter(entries)
            :map(function(entry)
              return entry.path
            end)
            :totable(),
          "\n"
        )
        local output_lines = {}
        local job_id = vim.fn.jobstart({ "git", "check-ignore", "--stdin" }, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            output_lines = data
          end,
        })

        -- command failed to run
        if job_id < 1 then
          return entries
        end

        -- send paths via STDIN
        vim.fn.chansend(job_id, all_paths)
        vim.fn.chanclose(job_id, "stdin")
        vim.fn.jobwait({ job_id })
        return require("mini.files").default_sort(vim
          .iter(entries)
          :filter(function(entry)
            return not vim.tbl_contains(output_lines, entry.path)
          end)
          :totable())
      end,
    },
  },
}
