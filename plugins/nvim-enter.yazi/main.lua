--- @since 25.2.26
--- @sync entry

local function setup(self, opts)
	self.open_multi = opts.open_multi
end

local function entry(self)
	local h = cx.active.current.hovered
	local nvim_env = os.getenv("NVIM")
	if nvim_env ~= nil and not (h and h.cha.is_dir) then
		-- os.execute('nvim --server $NVIM --remote-send \'<cmd>lua FeedKeys("e","m")<CR>\'')
		-- os.execute("nvim --server $NVIM --remote-send '<cmd>close<CR>'")
		ya.manager_emit(
			"shell",
			{
				block = false,
				string.format(
					"nvim --server $NVIM --remote-send '<cmd>close<cr><cmd>lua EditFromLazygit(\"%s\")<CR>'",
					tostring(cx.active.current.hovered.url)
				),
			}
		)
	else
		ya.mgr_emit(h and h.cha.is_dir and "enter" or "open", { hovered = not self.open_multi })
	end
end

return { entry = entry, setup = setup }
