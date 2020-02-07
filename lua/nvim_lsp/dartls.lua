local nvim_lsp = require 'nvim_lsp'
local configs = require 'nvim_lsp/configs'
local lsp = vim.lsp

local server_name = "dartls"
local bin_name = "dart"
local dart_sdk_path = os.getenv("DART_SDK")

configs[server_name] = {
  default_config = {
    cmd = {"dart", dart_sdk_path .. "/bin/snapshots/analysis_server.dart.snapshot", "--lsp"};
    filetypes = {"dart"};
    root_dir = nvim_lsp.util.root_pattern("pubspec.yaml");
    log_level = lsp.protocol.MessageType.Warning;
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = "false",
      suggestFromUnimportedLibraries = "true",
      closingLabels = "true",
      outline = "true",
      fluttreOutline= "false"
    };
    settings = {};
  };
  docs = {
    description = [[
https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec

Language server for dart.
]];
    default_config = {
      root_dir = "pubspec.yaml folder";
    };
  };
};


configs[server_name].install_info = function() 
  return {
    is_installed = dart_sdk_path ~= nil
  }
end

