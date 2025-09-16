return {
  -- =====================================================
  -- BLINK.CMP SETUP - Modern completion engine
  -- =====================================================
  {
    "saghen/blink.cmp",
    dependencies = {
      -- Compatibility layer to use nvim-cmp sources with blink.cmp
      { "saghen/blink.compat", lazy = true, version = false },
    },
    opts = {
      sources = {
        -- Enable obsidian.nvim completion sources through compat layer
        -- This allows obsidian's wiki links, tags, and note completion to work with blink
        compat = { "obsidian", "obsidian_new", "obsidian_tags" },
      },
    },
  },

  -- =====================================================
  -- OBSIDIAN.NVIM - Obsidian integration for Neovim
  -- =====================================================
  {
    "epwalsh/obsidian.nvim",
    version = "*",   -- Use latest stable release
    lazy = true,     -- Load only when needed
    ft = "markdown", -- Auto-load when opening markdown files

    -- Commands that trigger plugin loading
    cmd = {
      "ObsidianOpen",            -- Open note in Obsidian app
      "ObsidianNew",             -- Create new note
      "ObsidianQuickSwitch",     -- Quick switch between notes
      "ObsidianFollowLink",      -- Follow link under cursor
      "ObsidianBackLinks",       -- Show backlinks to current note
      "ObsidianTags",            -- Browse all tags
      "ObsidianToday",           -- Open/create today's daily note
      "ObsidianYesterday",       -- Open yesterday's daily note
      "ObsidianTomorrow",        -- Open tomorrow's daily note
      "ObsidianDailies",         -- Browse daily notes
      "ObsidianSearch",          -- Search notes content
      "ObsidianLink",            -- Link selected text to existing note
      "ObsidianLinkNew",         -- Link selected text to new note
      "ObsidianLinks",           -- Show all links in current note
      "ObsidianExtractNote",     -- Extract selection to new note
      "ObsidianWorkspace",       -- Switch between workspaces
      "ObsidianPasteImg",        -- Paste image from clipboard
      "ObsidianRename",          -- Rename current note
      "ObsidianTemplate",        -- Insert template
      "ObsidianNewFromTemplate", -- Create new note from template
    },

    dependencies = {
      "nvim-lua/plenary.nvim",         -- Required utility library
      "nvim-telescope/telescope.nvim", -- For note picker UI
    },

    -- =====================================================
    -- KEYBINDINGS - Organized by functionality
    -- =====================================================
    keys = {
      { "<leader>o",  desc = "Obsidian" }, -- Which-key group label

      -- FILE OPERATIONS - Creating, opening, managing notes
      { "<leader>on", "<cmd>ObsidianNew<cr>",             desc = "Create new note" },
      { "<leader>oo", "<cmd>ObsidianOpen<cr>",            desc = "Open note in Obsidian app" },
      { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>",     desc = "Quick switch notes" },
      { "<leader>or", "<cmd>ObsidianRename<cr>",          desc = "Rename current note" },

      -- NAVIGATION - Moving between notes and finding connections
      -- Note: gf is commented out to avoid conflicts with default behavior
      { "<leader>ob", "<cmd>ObsidianBackLinks<cr>",       desc = "Show backlinks" },
      { "<leader>ol", "<cmd>ObsidianLinks<cr>",           desc = "Show all links in note" },

      -- LINKING - Creating connections between notes (visual mode)
      { "<leader>oL", "<cmd>ObsidianLink<cr>",            mode = "v",                        desc = "Link selected text" },
      { "<leader>oN", "<cmd>ObsidianLinkNew<cr>",         mode = "v",                        desc = "Link to new note" },
      { "<leader>oe", "<cmd>ObsidianExtractNote<cr>",     mode = "v",                        desc = "Extract to new note" },

      -- DAILY NOTES - Time-based note management
      { "<leader>od", "<cmd>ObsidianToday<cr>",           desc = "Open today's note" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>",       desc = "Open yesterday's note" },
      { "<leader>ot", "<cmd>ObsidianTomorrow<cr>",        desc = "Open tomorrow's note" },
      { "<leader>oD", "<cmd>ObsidianDailies<cr>",         desc = "Browse daily notes" },

      -- SEARCH & ORGANIZATION - Finding notes and tags
      { "<leader>of", "<cmd>ObsidianSearch<cr>",          desc = "Search notes" },
      { "<leader>og", "<cmd>ObsidianTags<cr>",            desc = "Show all tags" },

      -- TEMPLATES - Standardized note creation
      { "<leader>oT", "<cmd>ObsidianTemplate<cr>",        desc = "Insert template" },
      { "<leader>oC", "<cmd>ObsidianNewFromTemplate<cr>", desc = "Create note from template" },

      -- WORKSPACE & MEDIA - Environment management and assets
      { "<leader>ow", "<cmd>ObsidianWorkspace<cr>",       desc = "Switch workspace" },
      { "<leader>op", "<cmd>ObsidianPasteImg<cr>",        desc = "Paste image" },

      -- UTILITY - Commented out to avoid conflicts
      -- { "<leader>ox", function() require("obsidian").util.toggle_checkbox() end, desc = "Toggle checkbox" },
    },

    opts = {
      -- =====================================================
      -- WORKSPACES - Different note environments
      -- =====================================================
      workspaces = {
        -- PERSONAL VAULT - Personal notes and journaling
        {
          name = "personal",
          path = "~/vaults/",
          overrides = {
            notes_subdir = "notes", -- Store notes in /notes subfolder
          },
        },
        -- DYNAMIC WORKSPACE - Works with any markdown file outside vaults
        -- This allows obsidian.nvim features on any .md file
        {
          name = "scratch",
          path = function()
            -- Use parent directory of current file as workspace root
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = vim.NIL,             -- No subfolder organization
            new_notes_location = "current_dir", -- Create notes in same directory
            templates = {
              folder = vim.NIL,                 -- No templates folder
            },
            disable_frontmatter = true,         -- No YAML metadata for scratch notes
          },
        },
      },

      -- Optional, for templates (see below).
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        -- substitutions = {
        --   id = function()
        --     return tostring(os.time())
        --   end,
        -- },
      },

      -- =====================================================
      -- NOTES CONFIGURATION - How notes are created and organized
      -- =====================================================
      notes_subdir = "notes",              -- Default subfolder for new notes
      new_notes_location = "notes_subdir", -- Where to create new notes
      log_level = vim.log.levels.INFO,     -- Logging verbosity
      preferred_link_style = "wiki",       -- Use [[wiki]] style links vs [markdown](links)
      open_notes_in = "vsplit",            -- Open notes in vertical split

      -- =====================================================
      -- DAILY NOTES - Automated daily note management
      -- =====================================================
      daily_notes = {
        folder = "notes/dailies",         -- Where to store daily notes
        date_format = "%Y-%m-%d-%a",      -- File naming: 2024-01-15.md
        time_format = "%H:%M",
        default_tags = { "daily-notes" }, -- Auto-add tags to daily notes
        template = "daily_note.md",       -- Template for new daily notes
      },

      -- =====================================================
      -- COMPLETION - Integration with completion engines
      -- =====================================================
      completion = {
        nvim_cmp = true, -- Enable nvim-cmp integration (works through blink.compat)
        min_chars = 2,   -- Trigger completion after 2 characters
      },

      -- =====================================================
      -- NOTE ID GENERATION - How new notes are named
      -- =====================================================
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- Convert title to valid filename: "My Note" → "my-note"
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- Generate random suffix if no title: "ABCD"
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        -- Result: "1642678456-my-note" (timestamp + title)
        return suffix
      end,

      -- =====================================================
      -- FRONTMATTER GENERATION - YAML metadata for notes
      -- =====================================================
      -- note_frontmatter_func = function(note)
      --   -- Add note title as an alias for easier linking
      --   if note.title then
      --     note:add_alias(note.title)
      --   end
      --
      --   -- Default metadata structure
      --   local out = {
      --     id = note.id,           -- Unique identifier
      --     aliases = note.aliases, -- Alternative names for linking
      --     tags = note.tags,       -- Categorization tags
      --     author = "s0n1xd3v",    -- Your username
      --     status = "draft",       -- draft, in-progress, completed
      --     -- type = "note",          -- note, daily, meeting, project
      --   }
      --
      --   -- Preserve any manually added frontmatter fields
      --   if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      --     for k, v in pairs(note.metadata) do
      --       out[k] = v
      --     end
      --   end
      --
      --   return out
      -- end,

      -- =====================================================
      -- LINK FUNCTIONS - How links are formatted
      -- =====================================================
      -- wiki_link_func = function(opts)
      --   -- Use obsidian's default wiki link formatting
      --   return require("obsidian.util").wiki_link_id_prefix(opts)
      -- end,

      -- =====================================================
      -- UI CONFIGURATION - Visual appearance and styling
      -- =====================================================
      ui = {
        enable = true,          -- Enable UI enhancements
        update_debounce = 200,  -- Delay before UI updates (ms)
        max_file_length = 5000, -- Don't render UI for large files

        -- CHECKBOX STYLING - Different checkbox states with icons
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
        },

        -- OTHER UI ELEMENTS
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },       -- Referenced text
        highlight_text = { hl_group = "ObsidianHighlightText" }, -- Highlighted text
        tags = { hl_group = "ObsidianTag" },                     -- Tag styling
        block_ids = { hl_group = "ObsidianBlockID" },            -- Block references

        -- COLOR SCHEME - Custom highlight groups for theming
        hl_groups = {
          ObsidianTodo = { bold = true, fg = "#f78c6c" },         -- Orange for todos
          ObsidianDone = { bold = true, fg = "#89ddff" },         -- Cyan for completed
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },   -- Orange for forwarded
          ObsidianTilde = { bold = true, fg = "#ff5370" },        -- Red for cancelled
          ObsidianImportant = { bold = true, fg = "#d73128" },    -- Bright red for important
          ObsidianBullet = { bold = true, fg = "#89ddff" },       -- Cyan for bullets
          ObsidianRefText = { underline = true, fg = "#c792ea" }, -- Purple underlined refs
          ObsidianExtLinkIcon = { fg = "#c792ea" },               -- Purple external links
          ObsidianTag = { italic = true, fg = "#89ddff" },        -- Cyan italic tags
          ObsidianBlockID = { italic = true, fg = "#89ddff" },    -- Cyan italic block IDs
          ObsidianHighlightText = { bg = "#75662e" },             -- Yellow background
        },
      },

      -- =====================================================
      -- ATTACHMENTS - Image and media management
      -- =====================================================
      attachments = {
        img_folder = "assets/imgs", -- Where to store pasted images

        -- Image naming function - adds timestamp prefix
        img_name_func = function()
          return string.format("%s-", os.time()) -- Results in: "1642678456-image.png"
        end,
      },
    },
  },
}
