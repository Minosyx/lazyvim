return {
    -- Configure alpha-nvim
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- ANSI Shadow logo
            local logo = {
                "███╗   ███╗██╗███╗   ██╗ ██████╗ ███████╗██╗   ██╗██╗  ██╗",
                "████╗ ████║██║████╗  ██║██╔═══██╗██╔════╝╚██╗ ██╔╝╚██╗██╔╝",
                "██╔████╔██║██║██╔██╗ ██║██║   ██║███████╗ ╚████╔╝  ╚███╔╝ ",
                "██║╚██╔╝██║██║██║╚██╗██║██║   ██║╚════██║  ╚██╔╝   ██╔██╗ ",
                "██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝███████║   ██║   ██╔╝ ██╗",
                "╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝",
            }

            -- Cyberpunk color palette
            local colors = {
                { name = "AlphaNeonBlue", base = "#00FFFF" },
                { name = "AlphaHotPink", base = "#FF00FF" },
                { name = "AlphaElectricPurple", base = "#AA00FF" },
                { name = "AlphaNeonGreen", base = "#00FFAA" },
            }
            local current_color_idx = 1

            -- Fade state
            local brightness = 255
            local fading = true

            -- UTF-8 safe glitch function
            local function glitch_line(line)
                local char_positions = vim.str_utf_pos(line)
                local chars = {}
                for i, pos in ipairs(char_positions) do
                    local next_pos = char_positions[i + 1] or (#line + 1)
                    chars[i] = line:sub(pos, next_pos - 1)
                end
                local glitched = ""
                for _, char in ipairs(chars) do
                    if math.random() < 0.01 then -- 1% chance for small glitch
                        glitched = glitched .. ({ "█", "▒", "░", "▌", "▐" })[math.random(1, 5)]
                    elseif math.random() < 0.002 then -- 0.2% chance for big glitch
                        glitched = glitched .. char .. ({ "~", "#", "@", "*" })[math.random(1, 4)]
                    else
                        glitched = glitched .. char
                    end
                end
                return glitched
            end

            -- Convert hex color to RGB and adjust brightness
            local function adjust_brightness(hex, level)
                local r = tonumber(hex:sub(2, 3), 16)
                local g = tonumber(hex:sub(4, 5), 16)
                local b = tonumber(hex:sub(6, 7), 16)
                r = math.floor(r * (level / 255))
                g = math.floor(g * (level / 255))
                b = math.floor(b * (level / 255))
                return string.format("#%02X%02X%02X", r, g, b)
            end

            -- Update header with glitch and fade
            local function update_header()
                local header_lines = {}
                for _, line in ipairs(logo) do
                    local glitched_line = glitch_line(line)
                    table.insert(header_lines, glitched_line)
                end
                local hl_group = "AlphaDynamic"
                local base_color = colors[current_color_idx].base
                local faded_color = adjust_brightness(base_color, brightness)
                vim.api.nvim_set_hl(0, hl_group, { fg = faded_color })
                dashboard.section.header.val = header_lines
                dashboard.section.header.opts = { position = "center", hl = hl_group }
            end

            -- Initial header
            update_header()

            -- Footer with plugin stats and lightning emoji (like snacks.nvim)
            local function update_footer()
                local stats = require("lazy").stats() -- Get lazy.nvim stats
                local loaded_plugins = stats.loaded -- Number of loaded plugins
                local total_plugins = stats.count -- Total number of plugins
                local startup_time = string.format("%.2f", stats.startuptime) -- in ms
                local footer_text =
                    string.format("Loaded %d/%d plugins in %s ms ⚡", loaded_plugins, total_plugins, startup_time)
                dashboard.section.footer.val = footer_text
                -- Mimic snacks.nvim footer style with a subtle cyan color
                vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#56B6C2" }) -- Cyan from snacks.nvim
                dashboard.section.footer.opts = { position = "center", hl = "AlphaFooter" }
            end

            -- Ensure true color support
            vim.o.termguicolors = true

            -- Prevent LazyVim interference
            dashboard.config.opts = dashboard.config.opts or {}
            dashboard.config.opts.noautocmd = true

            -- Apply config (no buttons/footer overrides)
            alpha.setup(dashboard.config)

            -- Timer for animation
            local timer = vim.uv.new_timer()
            if not timer then
                vim.api.nvim_echo({ { "Error: Timer creation failed", "ErrorMsg" } }, true, {})
                return
            end

            timer:start(
                0,
                200,
                vim.schedule_wrap(function()
                    -- Smoother color switch (~1s average)
                    if math.random() < 0.2 then
                        current_color_idx = (current_color_idx % #colors) + 1
                    end

                    -- Smoother fade
                    brightness = fading and brightness - 10 or brightness + 10
                    if brightness <= 50 then
                        fading = false
                    elseif brightness >= 255 then
                        fading = true
                    end

                    -- Update and redraw
                    update_header()
                    alpha.redraw()
                end)
            )

            -- Cleanup
            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    if timer then
                        timer:stop()
                        timer:close()
                    end
                end,
            })

            vim.schedule(function()
                update_footer()
                alpha.redraw()
            end)
        end,
    },
}
