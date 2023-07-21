contract SampleContract {

    function toBlockHash() public view returns (bytes32) {
        bytes32 parentHash = bytes32(0xaf71f0f29bfc18b5b0b0903f29ca3720692d8c49d1060d2a87ec4a2ab0ca9c8d);
        bytes32 sha3Uncles = bytes32(0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347);
        bytes32 stateRoot = bytes32(0x39b55d2fba32a8914b6cd08e4c38e2dac5f11dd48cde322a9656e3f7e41dc409);
        bytes32 transactionsRoot = bytes32(0xecac486ebc35ef9564ec959c1d49fd3aaef15e18245107319a46911c10a76f27);
        bytes32 receiptsRoot = bytes32(0x1c1477077cd770f230706dba2506880a84947f2228050290645c05bbde9f573b);
        uint difficulty = uint(0x0);
        uint number = uint(0x383cbd);
        uint gasLimit = uint64(0x1c9c380);
        uint gasUsed = uint64(0x74a8f9);
        uint timestamp = uint64(0x6488d24c);
        uint nonce = uint(0x0000000000000000);

        RLPReader.RLPItem memory rlp = bytes.concat(
            abi.encode(parentHash),
            abi.encode(sha3Uncles),
            abi.encode(stateRoot),
            abi.encode(transactionsRoot),
            abi.encode(receiptsRoot),
            abi.encode(difficulty),
            abi.encode(number),
            abi.encode(gasLimit),
            abi.encode(gasUsed),
            abi.encode(timestamp),
            abi.encode(nonce)
        ).toRlpItem();

        return keccak256(rlp.toRlpBytes());
    }
}
