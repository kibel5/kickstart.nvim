return {
  'github/copilot.vim',
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true

    local function SuggestOneWord()
      local _ = vim.fn['copilot#Accept'] ''
      local bar = vim.fn['copilot#TextQueuedForInsertion']()
      return vim.fn.split(bar, [[[ .]\zs]])[1]
    end

    vim.keymap.set('i', '<C-q>', function()
      vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
    end, { desc = 'Copilot Accept', noremap = true, silent = true })

    vim.keymap.set('i', '<C-w>', function()
      vim.fn.feedkeys(SuggestOneWord(), '')
    end, { desc = 'Copilot Accept One Word', noremap = true, silent = true })
  end,
}
