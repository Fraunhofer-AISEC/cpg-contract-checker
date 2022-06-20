pragma solidity 0.4.11;
contract test { bytes32 public hash; bytes32 public hash2; bytes32 public hash3; bytes32 public hash4;
function test () {
    address[2] memory _add;
    _add[0] = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    _add[1] = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    hash = sha256(_add[0],_add[1]);
    hash2 = sha256(_add);

    _add[0] = 0;
    _add[1] = 0;
    hash3 = sha256(_add[0],_add[1]);
    hash4 = sha256(_add);
}
}