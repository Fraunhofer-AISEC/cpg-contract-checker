contract EtherBlock {
    uint256 public nonce;
    event eOpenPosition(uint256 indexed PositionKey, address indexed Opener, uint256 EtherTossed, uint8 OddEven);
    function OpenPosition (uint8 OddEven) public {
        emit eOpenPosition(nonce, msg.sender, msg.value, OddEven);
    }
}
