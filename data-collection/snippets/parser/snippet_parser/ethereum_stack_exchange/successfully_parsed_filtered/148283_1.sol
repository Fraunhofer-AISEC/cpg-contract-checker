function Reset_tokens() public {
    require(msg.sender == manager, "Aborting, you are not the manager");

    uint length = participants.length;
    for (uint i = 0; i < length; i++) {
        TokenBalance[participants[i]] = 0;
    }
    _TotalTokens = 1000;
}
