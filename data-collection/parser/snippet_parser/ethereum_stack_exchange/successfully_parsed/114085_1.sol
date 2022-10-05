function prefixed(bytes32 hash) internal pure returns (bytes32) {
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
}

function checkIt () public {
    bytes memory signature = "0x564f8b7ca4a729a34aedf3b065e20b5eaa129fd663243697025a428f27db086e6a7d6dc429c95a44143117a9ea02cd452bce4242b1adb2742b02a4a44e6d389b1c";
    
    
    
    bytes32 r;
    bytes32 s;
    uint8 v;
    
    assembly {
        r := mload(add(signature, 32))
        s := mload(add(signature, 64))
        v := byte(0, mload(add(signature, 96)))
    }
    
    uint256 message = 1000000;
    address signerAddress = 0x8809465617E09405a1af06C2d93C2bcE0Ce5Ac80;
    
    Assert.equal(ecrecover(prefixed(keccak256(abi.encodePacked(message))), v, r, s), signerAddress, "Not equal!");
}
