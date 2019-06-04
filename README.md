# Workstation Setup

Re-worked workstation setup. Removing flaky CM's and building a more structured/simplified bash based setup.

## Usage

- `curl https://raw.githubusercontent.com/TheFynx/workstation-setup/master/config.sh | bash`
- `python -c 'import urllib; print urllib.urlopen(" https://raw.githubusercontent.com/TheFynx/workstation-setup/master/config.sh").read()' | bash`

Just download and run locally

- `curl https://raw.githubusercontent.com/TheFynx/workstation-setup/master/config.sh -o /tmp/config.sh`
- `wget -O - config.sh https://raw.githubusercontent.com/TheFynx/workstation-setup/master/config.sh`

### Options

- For custom user or group `config.sh -u username -g groupname`
- Use the `-?` flag to get the latest Options

```bash
  >>> Usage:
  -u | Pass Customer User - config.sh -u USER
  -g | Pass Customer Group - config.sh -g GROUP
  -p | Pass Packer Version to Install - config.sh -p 1.2.2
  -t | Pass Terraform Version to Install - config.sh -t 0.11.6
  -c | Pass Consul Version to Install - config.sh -c 1.1.0
```