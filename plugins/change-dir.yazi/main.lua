--- @since 25.2.26
--- @sync entry

local function setup(self, opts)
	self.open_multi = opts.open_multi
end

local function entry(self)
	-- os.execute('nvim --server $NVIM --remote-send \'<cmd>lua FeedKeys("e","m")<CR>\'')
	-- os.execute("nvim --server $NVIM --remote-send '<cmd>close<CR>'")
	ya.manager_emit("shell", {
		block = false,
		string.format(
			"nvim --server $NVIM --remote-send '<cmd>lua ChangeDirYazi(\"%s\")<CR>'",
			tostring(cx.active.current.hovered.url)
		),
	})
end

return { entry = entry, setup = setup }
