# azspin

Spinning up stuff in \[mostly\] Azure

## Dev Environment

```{text}
conda create -n dev python=3.9
conda activate dev
...
pip install azure-cli
```

## Conventions

* Always `terraform fmt -recursive`, especially before commits.
* Preceed every resource by link to resource page.  This way page can be quick
  referenced from `vscode` with 'Ctrl-Click'.  There has to be a better way to
  achieve same!!
* Order directives by 'containment', e.g. rg/loc/name.
* Suffice Terraform plan files as `.tfplan`.

### Resource naming

https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming


## Misc

* Azure locations: `az account list-locations -o table`
* List Azure VM sizes: `az vm list-sizes -o table -l westeurope`
* List SUSE images: `pint microsoft images --active --json | grep urn | sort | uniq`
