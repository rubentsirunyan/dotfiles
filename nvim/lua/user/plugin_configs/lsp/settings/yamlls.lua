return {
  settings = {
    yaml = {
      customTags = {
        '!Base64 scalar',
        '!Cidr scalar',
        '!And sequence',
        '!Equals sequence',
        '!If sequence',
        '!Not sequence',
        '!Or sequence',
        '!Condition scalar',
        '!FindInMap sequence',
        '!GetAtt scalar',
        '!GetAtt sequence',
        '!GetAZs scalar',
        '!ImportValue scalar',
        '!Join sequence',
        '!Select sequence',
        '!Split sequence',
        '!Sub scalar',
        '!Transform mapping',
        '!Ref scalar',
      },
      schemaStore = {
        -- built-in schemastore must be disabled to use
        -- the schemastore plugin
        enable = false,
      },
      schemas = require('schemastore').yaml.schemas {
        extra = {
          {
            description = "Custom Cloudformation file match",
            fileMatch = {"/**/cloudformation/*.yaml", "/**/cloudformation/*.yml"},
            name = "cloudformation.schema.json",
            url = "https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json",
          }
        }
      },
    }
  }
}
