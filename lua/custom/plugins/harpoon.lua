return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()
    local action_state = require('telescope.actions.state')
    local actions = require('telescope.actions')

    local remove_from_menu = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      harpoon:list():removeAt(selection.index)
      actions.close(prompt_bufnr)
    end

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
          map("n", "dd", remove_from_menu)
          return true
        end,
      }):find()
    end

    vim.keymap.set("n", "<C-a>", function() harpoon:list():append() end, { desc = 'Harpoon: Add file'})
    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = 'Harpoon: Toggle menu'})

    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = 'Harpoon: Go to file 1'})
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = 'Harpoon: Go to file 2'})
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = 'Harpoon: Go to file 3'})
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = 'Harpoon: Go to file 4'})

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'Harpoon: Go to next file'})
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'Harpoon: Go to previous file'})
  end
}
