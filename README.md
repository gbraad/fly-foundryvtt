# Foundry VTT Fly.io Setup

This project is about getting a [Foundry VTT](https://foundryvtt.com/) instance running on
[fly.io](https://fly.io/) servers. Using the docker deployment method it only takes a few minutes to
get a instanct up and running in the location of your choice.

## Steps

1. Make sure you have flyctl installed and logged in on local,
https://fly.io/docs/hands-on/install-flyctl/.
2. Download the linux node.js zip from the purchace page on Foundry, example: `FoundryVTT-10.291.zip`.
3. Extract that zip to a folder called `foundryvtt` in the root of the project.
4. Created the needed volume so all your game data survives server restarts.
```shell
$ fly volumes create foundry_vtt_data_v2 --region lhr --size 20`
```
5. Now you are ready to deploy!
```shell
$ flyctl launch
```
6. Scale up the ram so the service runs smoothly.
```shell
$ flyctl scale memory 1024
```
7. Check the fly.io dashboard for the public url and you are ready to use Foundry.

## Scaling down the service when not in use

One of the great parts about this setup is you can simply turn the server off when you don't need
it.

To shutdown:
```shell
$ flyctl scale count 0
```

To start back up:
```shell
$ flyctl scale count 1
```

## Credits
This project is heavily inspired by the docker setups found on the foundryvtt wiki
[here](https://foundryvtt.wiki/en/setup/hosting/Docker). I simply updated the node image, changes a
few things in the Dockerfile, and added a fly.io config.
