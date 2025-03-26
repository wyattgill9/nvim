return {
	{
		'saecki/crates.nvim',
		dependencies = { 'saghen/blink.compat', opts = { impersonate_nvim_cmp = true } },
		tag = 'stable',
		opts = {
			completion = {
				crates = { enabled = true },
				cmp = { enabled = true },
			},
		},
	},
	{
		'saghen/blink.cmp',
		dependencies = 'saecki/crates.nvim',
		opts = {
			sources = {
				default = { 'crates' },
				providers = {
					crates = {
						name = 'crates',
						module = 'blink.compat.source',
						fallbacks = { 'lsp' },
					},
				},
			},
		},
	},
    {

     'mrcjkb/rustaceanvim',
     version = '^5',
     lazy = false,

    },
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, { 'rust' })
			end
		end,
	},
}
