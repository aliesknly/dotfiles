return {
  "potamides/pantran.nvim",
  opts = {
    default_engine = "google", -- Usamos Google por ser gratis
    engines = {
      google = {
        fallback_fallback = "en", -- ldioma destino por defecto: Español
      },
    },
    window = {
      window_config = {
        border = "rounded", -- Ventana con bordes redondeados
      },
    },
  },
}
