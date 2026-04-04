return {
  "FluxxField/smart-motion.nvim",
  opts = {
    presets = {
      words = false,       -- w, b, e, ge
      lines = false,       -- j, k
      search = false,      -- s, f, F, t, T, ;, ,, gs
      delete = false,      -- d + any motion, dt, dT, rdw, rdl
      yank = false,        -- y + any motion, yt, yT, ryw, ryl
      change = false,      -- c + any motion, ct, cT
      paste = false,       -- p/P + any motion
      treesitter = false,  -- ]], [[, ]c, [c, ]b, [b, daa, caa, yaa, dfn, cfn, yfn, saa
      diagnostics = false, -- ]d, [d, ]e, [e
      git = false,         -- ]g, [g
      quickfix = false,    -- ]q, [q, ]l, [l
      marks = false,       -- g', gm
      misc = false,        -- . g. g0 g1-g9 gp gP gA-gZ gmd gmy (repeat, history, pins, global pins)
    },
  },
}
