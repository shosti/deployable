# Deployable

This is an example distributed Elixir app with a pre-baked CloudFormation VPC
stack, ready for use on AWS. Some features:

- Automatic deployment with CodeDeploy
- Building/releasing using distillery
- Multiple availability zones for fault tolerance
- Auto-scaling and load-balancing
- Networked Elixir nodes with discovery
- Live upgrades for the Elixir apps

Features I'm hoping to add:

- Helpers for remote monitoring over SSH
- Solutions for logging/monitoring/metrics
- Database with RDS

## Usage

- Make an AWS key pair for the instances
- Make a KMS key to encrypt secrets
- Make 2 S3 buckets: one for code deployments, and one for server config
- Change variables in `script/vars` accordingly
- `script/setup_secrets` to set up secrets config
- `script/put_secrets` (after editing priv/secrets.txt) to put initial secrets
- `script/create_stack` to make the initial release/stack (you can also use
  this script to update the stack if you make changes to the template)
- `script/release` to cut a new release and deploy (make sure the app version is
  incremented)

## Caveat Emptor

I am not an expert in AWS, networking, or security, so it is highly likely that
this is not production-ready (I made it for the learning experience). Use with
caution!

## Acknowledgments

The template for the CloudFormation stack is based on
[sample code](https://github.com/AWSinAction/code) from *AWS In Action*
(Manning, 2015).
