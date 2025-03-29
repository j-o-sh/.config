return function()
  vim.api.nvim_create_user_command("GitConflicts", function()
    require("telescope.builtin").find_files({
      prompt_title = "Git Conflict Files",
      cwd = vim.loop.cwd(),
      find_command = { "git", "diff", "--name-only", "--diff-filter=U" },
    })
  end, {})

  vim.api.nvim_create_user_command("GitListConflicts", function()
    local conflicts = {}
    local conflict_files = vim.fn.systemlist("git diff --name-only --diff-filter=U")

    for _, file in ipairs(conflict_files) do
      local lines = vim.fn.readfile(file)
      for i, line in ipairs(lines) do
        if line:match("^<<<<<<<") then
          table.insert(conflicts, { filename = file, lnum = i, col = 1, text = "Merge Conflict" })
        end
      end
    end

    if #conflicts > 0 then
      vim.fn.setqflist({}, " ", { title = "Git Merge Conflicts", items = conflicts })
      vim.cmd("copen")
    else
      print("No conflicts found.")
    end
  end, {})
end
