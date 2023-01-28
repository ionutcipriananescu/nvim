local telescope_setup, telescope = pcall(require, "telescope")
local actions_setup, actions = pcall(require, "telescope.actions")

-- check for missing dependencies and exit
if not (telescope_setup and actions_setup) then
  return
end

-- configure telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

-- load fzf extension
if pcall(require, "telescope.extensions.fzf") then
  telescope.load_extension("fzf")
end

