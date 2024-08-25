local M = {}

function M.get_dashboard()
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- Read ASCII art from file
    local ascii_art = {}
    local file = io.open(vim.fn.expand('~/.config/nvim/ascii_art2.txt'), "r")
    if file then
        for line in file:lines() do
            table.insert(ascii_art, line)
        end
        file:close()
    else
        -- Fallback ASCII art for ABDOU
        ascii_art = {
            "    _    ____  ____   ___  _   _ ",
            "   / \\  | __ )|  _ \\ / _ \\| | | |",
            "  / _ \\ |  _ \\| | | | | | | | | |",
            " / ___ \\| |_) | |_| | |_| | |_| |",
            "/_/   \\_\\____/|____/ \\___/ \\___/ ",
        }
    end

    -- Function to center a line of text
    local function center(text)
        local padding = math.floor((width - #text) / 2)
        return string.rep(' ', padding) .. text
    end

    -- Prepare centered ASCII art
    local centered_art = {}
    for _, line in ipairs(ascii_art) do
        table.insert(centered_art, center(line))
    end

    -- Prepare content
    local content = {
        "",
        "Welcome to Neovim, ABDOU!",
        "",
        "ff  : Find files",
        "fg  : Live grep",
        "fb  : Browse buffers",
        "",
        "GitHub: https://github.com/abdoufermat5",
        "",
    }

    -- Center all content
    local centered_content = {}
    for _, line in ipairs(content) do
        table.insert(centered_content, center(line))
    end

    -- Combine ASCII art and content
    local lines = {}
    local total_lines = #centered_art + #centered_content
    local top_padding = math.floor((height - total_lines) / 2)

    -- Add top padding
    for _ = 1, top_padding do
        table.insert(lines, "")
    end

    -- Add centered ASCII art
    for _, line in ipairs(centered_art) do
        table.insert(lines, line)
    end

    -- Add centered content
    for _, line in ipairs(centered_content) do
        table.insert(lines, line)
    end

    -- Add bottom padding
    while #lines < height do
        table.insert(lines, "")
    end

    return table.concat(lines, '\n')
end

return M
