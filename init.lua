require("smart-enter"):setup({
	open_multi = true,
})
require("nvim-enter"):setup({
	open_multi = true,
})

local nvim_env = os.getenv("NVIM")
if nvim_env ~= nil then
	require("no-status"):setup()
end
require("change-dir"):setup({
	open_multi = true,
})
require("git"):setup()

-- You can configure your bookmarks by lua language
local bookmarks = {}

require("yamb"):setup({
	-- Optional, the path ending with path seperator represents folder.
	bookmarks = bookmarks,
	-- Optional, recieve notification everytime you jump.
	jump_notify = false,
	-- Optional, the cli of fzf.
	cli = "fzf",
	-- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
	keys = false,
	-- Optional, the path of bookmarks
	path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark")
		or (os.getenv("HOME") .. "/.config/yazi/bookmark"),
})
