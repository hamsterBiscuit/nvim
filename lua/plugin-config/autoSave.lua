require("autosave").setup(
  {
    enabled = true,
    -- 触发自动保存的事件（退出插入模式或者普通模式下文本内容发生改变）
    events = {"InsertLeave", "TextChanged"},
    -- 自动保存时的提示信息
    execution_message = "",
    conditions = {
      exists = true,
      -- 忽略自动保存的文件名字或文件类型
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    -- 保存时写入全部的 Buffer
    write_all_buffers = true,
    on_off_commands = false,
    clean_command_line_interval = 0,
    debounce_delay = 135
  }
)
