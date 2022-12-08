local util = require "lspconfig.util"

local function get_typescript_server_path(root_dir)
  local global_ts = os.getenv('NPM_MODULES') .. '/typescript/lib'
  local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  print(os.getenv('NPM_MODULES') .. '/typescript/lib');
  local found_ts = ''
  local function check_dir(path)
    found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

return {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end
}
