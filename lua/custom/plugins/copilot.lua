vim.pack.add { 'https://github.com/github/copilot.vim' }
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

local function suggest_one_word()
  vim.fn['copilot#Accept'] ''
  local queued = vim.fn['copilot#TextQueuedForInsertion']()
  return vim.fn.split(queued, [[[ .]\zs]])[1]
end

vim.keymap.set('i', '<C-q>', function()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

vim.keymap.set('i', '<C-e>', function()
  vim.fn.feedkeys(suggest_one_word(), '')
end, { desc = 'Copilot Accept One Word', noremap = true, silent = true })
