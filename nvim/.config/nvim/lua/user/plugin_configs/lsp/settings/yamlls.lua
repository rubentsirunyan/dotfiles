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
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = {"/**)/cloudformation/*.yaml", "/**/cloudformation/*.yml"}
      }
    }
  }
}
