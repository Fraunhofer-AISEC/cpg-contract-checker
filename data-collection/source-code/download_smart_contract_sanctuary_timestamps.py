#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import pymongo
import requests

from web3 import Web3

MONGO_HOST = "sectrs-vascodagama"
MONGO_PORT = 27017

ETHERSCAN_API_KEY = "M8VPZT5CQ71TUQP9JNTTWMUMNS1J8KKC5B"

PROVIDER = Web3.HTTPProvider("https://mainnet.infura.io/v3/59bd984e502449f081d26eba3c624a32")

class colors:
    INFO = '\033[94m'
    OK = '\033[92m'
    FAIL = '\033[91m'
    END = '\033[0m'

def main():
    w3 = Web3(PROVIDER)
    if w3.isConnected():
        print(colors.INFO+"Connected to "+w3.clientVersion+colors.END)
    else:
        print(colors.FAIL+"Error: Could not connect to Ethereum client. Please check the provider!"+colors.END)

    mongo_connection = pymongo.MongoClient("mongodb://"+MONGO_HOST+":"+str(MONGO_PORT), maxPoolSize=None)
    collection = mongo_connection["smart_contract_snippets"]["smart_contract_sanctuary_timestamps"]

    for _, _, files in os.walk("smart-contract-sanctuary-ethereum"):
        for file in files:
            if file.endswith(".sol"):
                address = Web3.toChecksumAddress("0x"+file.split("_")[0])
                content = requests.get("https://api.etherscan.io/api?module=contract&action=getcontractcreation&contractaddresses="+str(address)+"&apikey="+str(ETHERSCAN_API_KEY)).json()
                if content["status"] == "1" and content["message"] == "OK":
                    result = content["result"][0]

                exists = collection.find_one({"contractAddress": result["contractAddress"]})
                if not exists:
                    transaction = w3.eth.get_transaction(result["txHash"])
                    result["blockNumber"] = transaction["blockNumber"]
                    result["blockHash"] = transaction["blockHash"].hex()
                    block = w3.eth.getBlock(block_identifier=result["blockNumber"], full_transactions=False)
                    result["timestamp"] = block["timestamp"]
                    collection.insert_one(result)
                    # Indexing...
                    if "contractAddress" not in collection.index_information():
                        collection.create_index("contractAddress", unique=True)
                        collection.create_index("contractCreator")
                        collection.create_index("txHash")
                        collection.create_index("blockNumber")
                        collection.create_index("blockHash")
                        collection.create_index("timestamp")
                    print("Downloaded timestamp for contract:", colors.INFO+str(result["contractAddress"])+colors.END)

if __name__ == "__main__":
    main()
