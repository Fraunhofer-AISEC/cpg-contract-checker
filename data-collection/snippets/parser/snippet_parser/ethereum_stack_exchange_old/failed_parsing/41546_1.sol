> con.getBalance()
[1000, "0x0679d661b585d1b4f0c3fd18f943f19e7fa9777fe23cb96b94f469c20d6f0bd5", "0x0679d661b585d1b4f0c3fd18f943f19e7fa9777fe23cb96b94f469c20d6f0bd5"]

function getBalance() view returns (uint16, bytes32, bytes32) {
    require(msg.sender == owner);
    uint16 mybalance = 1000;
    bytes32 c = keccak256(owner);
    bytes32 d = sha3(owner);
    return (mybalance, c, d);
}
