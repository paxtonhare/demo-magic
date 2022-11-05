# Continuing your demo on a remote server

If you need to demo ssh'ing into another computer and continuing the demo there, this script is for you.

It works by copying the necessary files to the remote server and running them via ssh.

## A note about simulated typing
Note that this script disables simulated typing by passing the `-d` option to demo-magic.sh. If you want simulated typing you need to install the [pv utitity](https://www.ivarch.com/programs/pv.shtml) on both your local and remote machines. Once pv is installed remember to remove the `-d` option to enable simulated typing.

## Running the SSH Server
In order for this to work you'll need a server to ssh into with ssh keys (not username/password).

### Handy Dandy Docker ssh server (optional)
This example conveniently includes a docker-compose for running an ssh server. If you use your own server don't forget to change the hostname in the ssh command.

To run the docker-compose demo, you need to do a few things.

1. Create a ./keys dir
1. Put your public ssh key into the ./keys/ directory
1. Replace `REPLACE_WITH_YOUR_KEY_FILE` with the actual file name in ./keys/
1. Replace `REPLACE_WITH_YOUR_USERNAME` with the username associated with the public key

Alternatively you can just go RTFM over at the [Docker Hub page for the ssh-server](https://hub.docker.com/r/linuxserver/openssh-server)

Now run:

`docker-compose up -d`

The docker ssh server is running on port 2222 by default.

After launching the ssh server, verify that you can actually log into it:

`ssh -p 2222 localhost`

## Running the demo

Once that works then you can run the demo.

`./remote-demo.sh`
