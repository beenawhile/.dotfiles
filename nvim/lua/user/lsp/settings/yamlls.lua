return {
  cmd = { "yaml-language-server"},
  filetypes = { "yaml" },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/pubspec.json"] = "/pubspec.yaml"
      }
    }
  },
  single_file_support = true,
  redhat = {
    telemetry = {
      enabled = true,
    }
  }
}
