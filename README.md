Sets up Grafana / Prometheus / Postgres
## Usage

## Installation
1. Install everything

	```
	$ git clone git@github.com:dieswaytoofast/grafana-docker.git
	$ cd ansible
	$ ansible-galaxy install -fr requirements.yml
	```
1. Grafana is now available on port **3000**
	1. If you are on Vagrant, you'll need to forward port 3000 to be able to get at it.  This implies adding something like the following to your Vagrantfile 
	
	```
	config.vm.network "forwarded_port", guest: 3000, host: 3000
	```

1. **NOTE - AWS** : You'll need to create an *aws_config.yml* file in the ansible directory. For format, look in the *ansible_aws* module (*requirements.yml*), and do something like `PB_aws_up.yml --extra-vars grafana_config_file=aws_config.yml`   Also, this presupposes permissions.
## Playbooks
### Names
1. `PB_grafana_up.yml` : Bring grafana up locally
2. `PB_egrafana_down.yml` : Take grafana down locally
1. `PB_aws_up.yml` : Bring grafana up on AWS
2. `PB_aws_down.yml` : Take grafana down on AWS


### Local Usage
1. Bringing everything up

```
$ cd ansible
$ sudo ansible-galaxy install -r requirements.yml
$ PB_grafana_up.yml
```
1. Taking everything down
	
```
$ PB_grafana_down.yml
	
```
1. Taking everything down, and flushing all volumes (removes logs!)
	
```
$ PB_grafana_down.yml --extra-vars refresh=true
```

1. Bringing everything up on AWS

```
$ cd ansible
$ sudo ansible-galaxy install -r requirements.yml
$ PB_aws_up.yml
```
1. Taking everything down
	
```
$ PB_aws_down.yml
	
```