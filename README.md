# QRL-Nightly-Chain

This is a snapshot of the QRL blockchain synced to a recent state. This repo updates every day to the latest chain height. 

> If you are worried about security, I suggest you spend the time to fully sync a node from scratch. There are instructions in the [QRL DOCS](https://docs.theqrl.org/node/QRLnode/).

## QRL Node Info

The latest information taken before the snapshot was taken.

```json
{
        "Node":[
                {"blockchainSize": "3.9G" },
                {"blockheight":"490484"},
                {"version":"1.1.7 python"},
                {"networkId":"The sleeper must awaken"},
                {"state":"SYNCED"},
                {"numConnections":4},
                {"numKnownPeers":56051},
                {"uptime":"15804458"},
                {"blockLastHash":"PwqZnpIGeCsGiirB7AvFlYdHEzZ5vnlj000QAgAAAAA="}
		],
	 "REPO":[
                {"Compressed_Node_Size": "2.7G"},
		]
}
```

## Install Instructions


The QRL blockchain has been broken up into multiple `tar.gz` archives to preserve the github requirements of less than 100Mb size. THis repo will not track the last commit or any revision history here in GitHub. This is to limit the size of this repo for distrobution.

Verify the checksum matches what is in the file, and if so recombine the files in the /splitState directory. Follow the instructions to save a ton of time.

- Clone this repo to the users home directory. `git clone https://github.com/fr1t2/QRL-Nightly-Chain.git`
- Change into the dir. `cd ~/QRL-Nightly-Chain`
- Run `./combine.sh` to combine the tar files and recreate the blockchain 
  - This will create a `state/` directory with the chain up until the last snapshot height. 
- Move this folder to your `~/.qrl/data/` directory and restart the node to pickup the chain.

> !! Make sure the permissions and owner is correct in your local directory structure!


## Manually Combine Commands


Change into the repo dir. 

`cd ~/QRL-Nightly-Chain/`

Run the following command to reconstruct the files.

`cat splitState/QRL_state.tar.gz* | tar -xzvf -`

This will create the state directory. 

Move `state` into the users `~/.qrl/data/` directory and then start the node. 

`mkdir --parents ~/.qrl/data/; mv ./state $_`

`start_qrl`

## Back Up QRL BlockChain

If you want to run this process yourself, this is how it is accomplished here.
First sync a QRL node fully, once complete, run these commands.

```bash
mkdir -p QRLbackup/state
cd QRLbackup
cp ~/.qrl/data/state/* ./state -r
tar -czvf - ./state/* |split -b 50M - QRL_state.tar.gz
sha256sum QRL_state.tar.gza* > checksums.txt && echo "" >> checksums.txt 
md5sum QRL_state.tar.gza* >> checksums.txt
```

You will have a copy of the blockchain zipped up and split in a way that can sync to github or slap on a flash drive. Enjoy!


## QRLstate AutoCompile Script

This script is run daily to grab the locally synced blockchain and save a copy, compress it and upload it to the repo for deployment. Make sure you have an ssh key setup with the github repo you want to connect to.  


### Cron Job

Add this to your cron file.

```bash
crontab -e
```

```cron
0 0 * * *  /home/qrl/QRL-Nightly-Chain/AutoUpdate_QRLstate.sh
```

Make sure the script above is executable by the cron user and enjoy a fresh copy of the blockchain in a github repo.

---

Donations welcome! Donation addresses:

QRL-
`Q010900978071f5817ece4164123a5b83f80af957a9935876329bb1f015410e4542ed291ee7022f`

BTC-
`3MZjtne9XJh1SKFJDBpK7YgEmmCwQLtfN8`

ETH-
`0x4C3F479D66B14405897B26ACa9007985B27f4c43`

---

