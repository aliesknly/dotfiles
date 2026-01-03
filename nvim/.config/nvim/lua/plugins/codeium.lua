return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function()
      -- Evita que el plugin configure sus keymaps por defecto
      vim.g.codeium_disable_bindings = 1

      -- Aceptar la sugerencia con Ctrl-;
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, noremap = true, silent = true })

      -- (Opcional) Ciclar sugerencias adelante / atrás
      -- Nota: si estas funciones no funcionan con la versión del plugin,
      -- consulta el README de codeium.vim para los nombres exactos.
      vim.keymap.set("i", "<C-]>", function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, noremap = true, silent = true })


      vim.keymap.set("i", "<C-[>", function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, noremap = true, silent = true })

      -- Mapa para completar manualmente (si quieres)
      vim.keymap.set("i", "<C-Space>", function()
        return vim.fn['codeium#Complete']()
      end, { expr = true, noremap = true, silent = true })
    end,
  },
}
