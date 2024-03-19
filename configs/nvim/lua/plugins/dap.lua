return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            -- Build the executable
            vim.system({'cargo', 'build'}):wait()

            local project_directory = vim.fs.dirname(
              vim.fs.find('Cargo.toml', {
                upward = true,
                path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
              })[1]
            )

            local path = vim.fs.joinpath(
              project_directory,
              "target/debug",
              vim.fs.basename(project_directory)
            )

            return path
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        }
      }

      -- Custom icons
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl='Error', linehl='', numhl='' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl='Conditional', linehl='', numhl='' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl='Label', linehl='', numhl='' })
      vim.fn.sign_define('DapStopped', { text = '󰁕', texthl='Constant', linehl='', numhl='' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl='Error', linehl='', numhl='' })

      -- Keybindings
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set('n', '<leader>dr', dap.continue, { desc = "Start debug session" })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = "Terminate debug session" })
      vim.keymap.set('n', '<leader>dp', dap.pause, { desc = "Pause thread" })
      vim.keymap.set({'n', 'v'}, '<leader>dh', function ()
        require("dap.ui.widgets").hover()
      end, { desc = "Evaluate the expression and display the result in a floating window" })

      vim.keymap.set('n', '<leader>ss', dap.step_over, { desc = "Debug: Step over" })
      vim.keymap.set('n', '<leader>si', dap.step_into, { desc = "Debug: Step into" })
      vim.keymap.set('n', '<leader>so', dap.step_out, { desc = "Debug: Step out" })
      vim.keymap.set('n', '<leader>su', dap.pause, { desc = "Go up in current stacktrace without stepping" })
      vim.keymap.set('n', '<leader>sd', dap.pause, { desc = "Go down in current stacktrace without stepping" })
      vim.keymap.set('n', '<leader>sd', dap.pause, { desc = "Go down in current stacktrace without stepping" })
      vim.keymap.set('n', '<leader>sr', dap.pause, { desc = "Debug: Run to cursor" })

    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function ()
      local dap, dapui = require("dap"), require("dapui")

      -- Automatically open and close dap-ui
      dap.listeners.before.attach.dapui_config = function ()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function ()
        dapui.close()
      end
    end
  }
}
