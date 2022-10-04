

contract Test {

    event event1(uint id);
    event event2(string name);
    uint id = 1;

    function buy() public payable {

        event1(id);
        event2('testing');
        id++;

    }

}





null[
  {
    "logIndex": 0,
    "transactionIndex": 0,
    "transactionHash": "0x81979a998ae284933bb890585020692aad9dfa27bf6b8e6425aa2c9affcdfd43",
    "blockHash": "0x5c1f608098236c1eba26b53c872cf379cd3e82079330b2d06d40c6ce4df5811b",
    "blockNumber": 2,
    "address": "0x71ea15737ce3f92e205e3a3dad0263e344d53f24",
    "data": "0x0000000000000000000000000000000000000000000000000000000000000001",
    "topics": [
      "0x84e603adc6c5752ecafe165459551af7ba28bb2e6a2bfacc9ccb8f0ae12c76e6"
    ],
    "type": "mined"
  },
  {
    "logIndex": 1,
    "transactionIndex": 0,
    "transactionHash": "0x81979a998ae284933bb890585020692aad9dfa27bf6b8e6425aa2c9affcdfd43",
    "blockHash": "0x5c1f608098236c1eba26b53c872cf379cd3e82079330b2d06d40c6ce4df5811b",
    "blockNumber": 2,
    "address": "0x71ea15737ce3f92e205e3a3dad0263e344d53f24",
    "data": "0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000774657374696e6700000000000000000000000000000000000000000000000000",
    "topics": [
      "0xd61481a11e5449d64f97e1edf49aec06a9ff79cef718c30115a331a73ae49cb4"
    ],
    "type": "mined"
  }
]
