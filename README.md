# argo-routed-workspace

Use Cloudflare argo to create your own private SSH-able workspace in AWS.

### Setup
- Verify Docker and brew installed locally
- Install aws-vault: `brew install aws-vault`
- Setup your aws account creds: `aws-vault add worldpeace`
- You may want to setup a `terraform.tfvars` with any information that is requested during the deploy
- Place your argo cert and config yml in a private Cloudflare bucket

### How to lint and test infrastructure changes
- `make`

### How to deploy
- `make deploy`

### How to ssh into workspace

- [Connect over SSH](https://developers.cloudflare.com/access/ssh/connect-ssh/)
