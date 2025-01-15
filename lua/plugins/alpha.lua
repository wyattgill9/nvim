return {
    {
      "goolord/alpha-nvim",
      lazy = false,
      config = function()
        local present, alpha = pcall(require, "alpha")
        if not present then
          return
        end
  
        local dashboard = require("alpha.themes.dashboard")
        local icons = require("utils.icons")
        local if_nil = vim.F.if_nil
        local fn = vim.fn
        local config_dir = fn.stdpath('config')
  
        -- Header

        local header = {
          "                                                     ",
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          "                     wyattgill@zen                  ",
        }
  
        dashboard.section.header.type = "text";
        dashboard.section.header.val = header;
        dashboard.section.header.opts = {
          position = "center",
          hl = "vimHeader",
        }
  
        local leader = "SPC"
  
        --- @param sc string
        --- @param txt string
        --- @param keybind string optional
        --- @param keybind_opts table optional
        local function button(sc, txt, keybind, keybind_opts)
          local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
  
          local opts = {
            position = "center",
            shortcut = sc,
            cursor = 5,
            width = 50,
            align_shortcut = "right",
            hl_shortcut = "vimPrimary",
          }
          if keybind then
            keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
            opts.keymap = { "n", sc_, keybind, keybind_opts }
          end
  
          local function on_press()
            -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
            local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
          end
  
          return {
            type = "button",
            val = txt,
            on_press = on_press,
            opts = opts,
          }
        end
  
        dashboard.section.buttons.val = {
          button("f", icons.fileNoBg .. " " .. "Find File", "<cmd>Telescope find_files<CR>", {}),
          button("w", icons.word .. " " .. "Find Word",
            "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {}),
          button("h", icons.fileRecent .. " " .. "Recents", "<cmd>Telescope oldfiles hidden=true<CR>", {}),
          button("u", icons.packageDown .. " " .. "Update Plugins", "<cmd>Lazy update<CR>", {}),
          button("m", icons.package .. " " .. "Manage Plugins", "<cmd>Lazy<CR>", {}),
          button("s", icons.cog .. " " .. "Settings", "<cmd>e $MYVIMRC<CR>", {}),
          button("<ESC>", icons.exit .. " " .. "Exit", "<cmd>exit<CR>", {}),
        }
  
        local section = {
          header = dashboard.section.header,
          buttons = dashboard.section.buttons,
          footer = dashboard.section.footer,
        }
  
        -- Setup                                                    
  
        local opts = {
          layout = {
            { type = "padding", val = 3 },
            section.header,
            { type = "padding", val = 1 },
            section.hi_top_section,
            section.hi_middle_section,
            section.hi_bottom_section,
            { type = "padding", val = 2 },
            section.buttons,
            { type = "padding", val = 3 },
            section.footer,
          },
          opts = {
            margin = 5
          },
        }
  
        alpha.setup(opts)
  
        vim.api.nvim_create_augroup("alpha_tabline", { clear = true })
  
        vim.api.nvim_create_autocmd("FileType", {
          group = "alpha_tabline",
          pattern = "alpha",
          command = "set showtabline=0 laststatus=0 noruler",
        })
  
        vim.api.nvim_create_autocmd("FileType", {
          group = "alpha_tabline",
          pattern = "alpha",
          callback = function()
            vim.api.nvim_create_autocmd("BufUnload", {
              group = "alpha_tabline",
              buffer = 0,
              command = "set showtabline=2 ruler laststatus=3",
            })
          end,
        })
      end,
    }
  }
