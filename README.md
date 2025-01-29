# Testing module version constraints using the Resourcely Github Action

This repository demonstrates how to integrate Resourcely into a repository that uses Github Actions to test module version constraints.

More information about module version constraints can be found in the [Resourcely documentation](https://docs.resourcely.io/concepts/other-features-and-settings/module-versions).

The setup contains a [workflow](.github/workflows/terraform.yml) uses the [Resourcely Github Action](https://github.com/Resourcely-Inc/resourcely-action) to
evaluate guardrails on the Terraform in this repository. 

The workflow follows these steps:

1. Runs `terraform init`, which produces the file _.terraform/modules/modules.json_. This file contains the metadata required for guardrails to constrain module versions.
2. The first stage uploads the modules file for the second stage to download, thereby sharing the file between stages.
3. The `resourcely-ci` stage invokes the Resourcely Github Action, passing `with: modules_file` to provide the downloaded modules file.
4. The Resourcely Github Action invokes the Resourcely CLI, passing `--modules_file`.

## Usage

This repository is a template. Some setup is required after cloning to use it.

### 1. Configure Terraform Backend

Running Terraform in Github Actions requires storing the Terraform state in a durable backend.  
Terraform supports a variety of backends described [here](https://developer.hashicorp.com/terraform/language/settings/backends/configuration).

Edit [terraform.tf](terraform.tf) to add and configured your chosen backend.

### 2. Add Resourcely API Token to Github Secrets.

The Resourcely Github Action requires an API token to authenticate to the Resourcely API.

- Generate a new API token in the [Resourcely portal](https://portal.resourcely.io/settings/generate-api-token)
- Create a new [Github repository secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository) named `RESOURCELY_API_TOKEN` containing this token.

### 3. Update .resourcely.yaml if needed

`.resourcely.yaml` tells Resourcely where to find the Terraform configs within this repo.  
If you move the config out of the repository root or add new configs in subdirectories, update the file to reflect these changes.

### 4. Ensure you have a valid manifest configuration.
The configuration are specified here [manifest](https://github.com/Resourcely-Inc/scaffolding-github-actions/blob/main/.github/workflows/terraform.yml#L89-L101)

### 5. Create a guardrail in Resourcely

To see how a guardrail applies to a module, create a guardrail in Resourelcy that sets a constraint on the module example found in [main.tf](main.tf).

```
GUARDRAIL "Testing module version constraints"
  WHEN module.source = "registry.terraform.io/carljavier/pet/random"
    REQUIRE version MATCHES VERSION "> 0.0.5"
```

