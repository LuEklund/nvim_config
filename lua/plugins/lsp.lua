return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.config("zls", {
      -- ZLS (0.16.x) only ever loads ~/.config/zls.json; it does NOT look for a
      -- zls.json in the workspace. Without --config-path, every package in a
      -- multi-package repo gets the same global build_on_save_args, which cannot
      -- work when the packages have different step names. So point it at the
      -- root's own zls.json when there is one.
      cmd = function(dispatchers, config)
        local root = config.root_dir or vim.uv.cwd()
        local args = { "/usr/local/bin/zls" }
        local project_config = root .. "/zls.json"
        if vim.uv.fs_stat(project_config) then
          vim.list_extend(args, { "--config-path", project_config })
        end
        return vim.lsp.rpc.start(args, dispatchers, { cwd = root })
      end,
      -- Build-on-save surfaces compile errors as diagnostics AND rebuilds
      -- the timestamped dynlib so hot reload kicks in on save. Don't set
      -- `build_on_save_args = {"check"}` -- a check step uses -fno-emit-bin
      -- and would not emit the dynlib, breaking hot reload.
      --
      -- Deliberately NO `settings` block: anything declared here outranks
      -- each project's zls.json, so per-package build steps could never be
      -- configured. Packages that must not build on save (their zig-out is
      -- not where the running binary looks) can then opt out in their own
      -- zls.json.
    })

    vim.lsp.enable({ "clangd", "zls", "lua_ls" })

  end,
}
