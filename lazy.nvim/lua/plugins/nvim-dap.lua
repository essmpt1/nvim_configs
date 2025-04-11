return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Adaptador usando GDB via cpptools
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
			options = {
			detached = false
			}
		}

		-- Configuração para C (também funciona com C++)
		dap.configurations.c = {
		{
			name = "Launch (GDB)",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = true,
			setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'Enable GDB pretty printing',
				ignoreFailures = false
			}
			},
			miDebuggerPath = '/usr/bin/gdb', -- caminho para o gdb
		}}

		dap.configurations.cpp = dap.configurations.c

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		-- Abre o dap-ui automaticamente ao iniciar a depuração
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		-- Fecha o dap-ui automaticamente ao terminar a depuração
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
	end
}
