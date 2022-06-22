>>> from hexbytes import HexBytes
>>> from eth_abi import decode_string
>>> memory = "".join(structLog[-1]['memory'])
>>> decode_abi(['string'], HexBytes(memory[8:200]))
(b'Address not registered')
