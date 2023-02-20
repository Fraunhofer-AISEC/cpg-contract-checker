#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import pymongo
import requests

from web3 import Web3
from itertools import cycle
from datetime import datetime

MONGO_HOST = "sectrs-vascodagama"
MONGO_PORT = 27017

ETHERSCAN_API_KEYS = ["ANAZQYWNY3ZBIIMIY9P153TE6Y78PUM226", "M8VPZT5CQ71TUQP9JNTTWMUMNS1J8KKC5B", "VZ7EMQBT4GNH5F6FBV8FKXAFF6GS4MPKAU"]

PROVIDER_1 = Web3.HTTPProvider("https://mainnet.infura.io/v3/59bd984e502449f081d26eba3c624a32")
PROVIDER_2 = Web3.HTTPProvider("https://mainnet.infura.io/v3/41e2dadcce7245d986bbc9e1196ca43b")

#PROVIDER_1 = Web3.HTTPProvider("http://sectrs-vascodagama:8545")
#PROVIDER_2 = Web3.HTTPProvider("http://sectrs-vascodagama:8545")

class colors:
    INFO = '\033[94m'
    OK = '\033[92m'
    FAIL = '\033[91m'
    END = '\033[0m'

def main():
    w3_1 = Web3(PROVIDER_1)
    if w3_1.isConnected():
        print(colors.INFO+"Connected to "+w3_1.clientVersion+colors.END)
    else:
        print(colors.FAIL+"Error: Could not connect to Ethereum client. Please check the provider!"+colors.END)

    w3_2 = Web3(PROVIDER_2)
    if w3_2.isConnected():
        print(colors.INFO+"Connected to "+w3_2.clientVersion+colors.END)
    else:
        print(colors.FAIL+"Error: Could not connect to Ethereum client. Please check the provider!"+colors.END)

    mongo_connection = pymongo.MongoClient("mongodb://"+MONGO_HOST+":"+str(MONGO_PORT), maxPoolSize=None)
    collection = mongo_connection["smart_contract_snippets"]["smart_contract_sanctuary_timestamps"]

    api_key = cycle(ETHERSCAN_API_KEYS)

    w3_api = cycle(range(2))

    for _, _, files in os.walk("smart-contract-sanctuary-ethereum"):
        for file in files:
            if file.endswith(".sol"):
                address = Web3.toChecksumAddress("0x"+file.split("_")[0])
                exists = collection.find_one({"contractAddress": address.lower()})
                print(address)
                if not exists:
                    try:
                        content = requests.get("https://api.etherscan.io/api?module=contract&action=getcontractcreation&contractaddresses="+str(address)+"&apikey="+str(next(api_key))).json()
                        if content["status"] == "1" and content["message"] == "OK":
                            result = content["result"][0]
                            w3 = w3_1
                            if next(w3_api) == 1:
                                w3 = w3_2
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
                            now = datetime.now()
                            dt_string = now.strftime("%Y-%m-%d %H:%M:%S")
                            print(dt_string, "Downloaded timestamp for contract:", colors.INFO+str(result["contractAddress"])+colors.END)
                    except:
                        print(dt_string, colors.FAIL+"Error: Could not download timestamp for contract:", address, colors.END)
    print("Done.")


if __name__ == "__main__":
    main()
