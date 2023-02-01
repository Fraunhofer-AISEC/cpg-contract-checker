function random() internal returns (uint) {
    uint randomnumber = uint(keccak256(abi.encodePacked(now, msg.sender, nonce))) % 900;
    randomnumber = randomnumber + 100;
    nonce++;
    return randomnumber;
}
