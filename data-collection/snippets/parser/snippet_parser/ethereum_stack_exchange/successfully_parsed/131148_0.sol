 
function setSigner(address _newSigner) public {
    require(msg.sender != signer, "You are not the current signer");
    signer = _newSigner;
}


function mintTokensWithSignature(
    uint256 amount,
    bytes32 _r,
    bytes32 _s,
    uint8 _v
) public {
    bytes memory prefix = "\x19Ethereum Signed Message:\n32";
    bytes32 messageHash = keccak256(
        abi.encode(address(this), amount, msg.sender)
    );
    bytes32 hashToCheck = keccak256(abi.encodePacked(prefix, messageHash));
    require(
        signer == ecrecover(hashToCheck, _v, _r, _s),
        "Wrong signature"
    );
    _mint(msg.sender, amount);
}
