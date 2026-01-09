return {
"lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    -- VimTeX configuration
    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex --noraise"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      options = {
        "-pdf",               -- Compile to PDF
        "-interaction=nonstopmode", -- Don't stop for errors
        "-synctex=1",         -- Enable SyncTeX
        "-file-line-error",   -- Better error messages
      },
    }
    vim.g.vimtex_compiler_latexmk_continuous = 1 -- Ensure continuous compilation
    vim.g.vimtex_compiler_latexmk_background = 1 -- Run in the background

    -- Optional: Disable auto stop on certain events
    vim.g.vimtex_compiler_latexmk_hooks = {
      on_init = nil,
      on_exit = nil,
    }

    -- Prevent the compilation process from stopping on errors
    -- vim.g.vimtex_compiler_silent = 1
    vim.g.vimtex_compiler_enabled = 1
  end,
}
