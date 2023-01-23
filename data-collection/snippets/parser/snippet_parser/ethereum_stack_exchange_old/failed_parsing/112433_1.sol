import json, re
import random
import sys
import ethereum.blocks
import ethereum.utils
import ethereum.abi
import rlp
try:
    from urllib.request import build_opener 
except:
    from urllib2 import build_opener

my_privkey = ethereum.utils.sha3('qwufqhwiufyqwiugxqwqcwrqwrcqr')
my_address = ethereum.utils.privtoaddr(my_privkey).encode('hex')
print 'My address', my_address
# Address of the main proxy contract
my_contract_address = ethereum.utils.normalize_address('0xd53096b3cf64d4739bb774e0f055653e7f2cd710')

# Makes a request to a given URL (first arg) and optional params (second arg)
def make_request(*args):
    opener = build_opener()
    opener.addheaders = [('User-agent',
                          'Mozilla/5.0'+str(random.randrange(1000000)))]
    try: 
        return opener.open(*args).read().strip()
    except Exception as e:
        try:
            p = e.read().strip()
        except:
            p = e
        raise Exception(p)


true, false = True, False
# ContractTranslator object for the main proxy contract
ct = ethereum.abi.ContractTranslator([{"constant": false, "type": "function", "name": "get(string)", "outputs": [{"type": "int256", "name": "out"}], "inputs": [{"type": "string", "name": "url"}]}, {"inputs": [{"indexed": false, "type": "string", "name": "url"}, {"indexed": false, "type": "address", "name": "callback"}, {"indexed": false, "type": "uint256", "name": "responseId"}, {"indexed": false, "type": "uint256", "name": "fee"}], "type": "event", "name": "GetRequest(string,address,uint256,uint256)"}])
# ContractTranslator object for the contract that is used for testing the main contract
ct2 = ethereum.abi.ContractTranslator([{"constant": false, "type": "function", "name": "callback(bytes,uint256)", "outputs": [], "inputs": [{"type": "bytes", "name": "response"}, {"type": "uint256", "name": "responseId"}]}])

app, my_nonce, chainservice = None, None, None

# Called once on startup
def on_start(_app):
    print 'Starting URL translator service'
    global app, my_nonce, chainservice
    app = _app
    chainservice = app.services.chain
    my_nonce = chainservice.chain.head.get_nonce(my_address)


# Called every block
def on_block(blk):
    global my_nonce, chainservice
    for receipt in blk.get_receipts():
        for _log in receipt.logs:
            # Get all logs to the proxy contract address of the right type
            if _log.address == my_contract_address:
                log = ct.listen(_log)
                if log and log["_event_type"] == "GetRequest":
                    print 'fetching: ', log["url"]
                    # Fetch the response
                    try:
                        response = make_request(log["url"])
                    except:
                        response = ''
                    print 'response: ', response
                    # Create the response transaction
                    txdata = ct2.encode('callback', [response, log["responseId"]])
                    tx = ethereum.transactions.Transaction(my_nonce, 60 * 10**9, min(100000 + log["fee"] / (60 * 10**9), 2500000), log["callback"], 0, txdata).sign(my_privkey)
                    print 'txhash: ', tx.hash.encode('hex')
                    print 'tx: ', rlp.encode(tx).encode('hex')
                    # Increment the nonce so the next transaction is also valid
                    my_nonce += 1
                    # Send it
                    success = chainservice.add_transaction(tx, broadcast_only=True)
                    assert success
                    print 'sent tx'
