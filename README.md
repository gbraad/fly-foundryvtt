# Foundry VTT Fly.io Setup

This project is about getting a [Foundry VTT](https://foundryvtt.com/) instance running on
[fly.io](https://fly.io/) servers. Using the docker deployment method it only takes a few minutes to
get a instance up and running in the location of your choice.

## Steps

<ol>
<li>Make sure you have flyctl installed and logged in on local, https://fly.io/docs/hands-on/install-flyctl/.</li>
<li>Clone this repo.</li>
<li>Download the linux node.js zip from the purchase page on Foundry, example: `FoundryVTT-10.291.zip`.</li>
<li>Extract that zip to a folder called `foundryvtt` in the root of the project.</li>
<li>
    <p>Created the needed volume so all your game data survives server restarts.</p>
    <div class="highlight"><pre><span></span>$ fly volumes create foundry_vtt_data_v2 --region lhr --size 20</pre></div>
</li>
<li>
    <p>Now you are ready to deploy!</p>
    <div class="highlight"><pre><span></span>$ flyctl launch</pre></div>
</li>
<li>
    <p>Scale up the ram so the service runs smoothly.</p>
    <div class="highlight"><pre><span></span>$ flyctl scale memory 1024</pre></div>
</li>
<li>Check the fly.io dashboard for the public url and you are ready to use Foundry.</li>
</ol>

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
