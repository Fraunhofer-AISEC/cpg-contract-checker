address private admin = 0x...;
address private emergencyAdmin = 0x...;

function emergency(
    address newAdmin,
    address newEmergencyAdmin,
    uint8 v,
    bytes32 r,
    bytes32 s,
    uint8 v2,
    bytes32 r2,
    bytes32 s2
)
    public
{
    bytes32 h = prefixedHash(abi.encodePacked(newAdmin, newEmergencyAdmin));

    require(ecrecover(h, v, r, s) == admin);
    require(ecrecover(h, v2, r2, s2) == emergencyAdmin);

    admin = newAdmin;
    emergencyAdmin = newEmergencyAdmin;
}

function prefixedHash(bytes message) private pure returns (bytes32) {
    bytes32 h = keccak256(message);
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", h));
}
