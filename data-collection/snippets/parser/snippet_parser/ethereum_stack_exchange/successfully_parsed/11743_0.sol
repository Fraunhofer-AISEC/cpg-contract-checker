contract ECVerify {
    function ecverify(bytes32 hash, bytes sig, address signer) returns (bool);
}

contract Foo {
    ECVerify ecv = ECVerify(0x3bbb367afe5075e0461f535d6ed2a640822edb1c);

    function callEcv(bytes32 hash, bytes sig, address signer) {
        bool b = ecv.ecverify(hash, sig, signer);
        
    }
}
