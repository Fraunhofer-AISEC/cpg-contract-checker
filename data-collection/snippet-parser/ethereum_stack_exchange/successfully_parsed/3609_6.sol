function getChannel(bytes32 channelId) returns(
    address addr0,
    address addr1,
    uint8 phase,
    uint challengePeriod,
    uint closingBlock,
    bytes state,
    uint sequenceNumber,
    bytes evidence0,
    bytes evidence1
) {
    addr0 = channels[channelId].addr0;
    addr1 = channels[channelId].addr1;
    phase = channels[channelId].phase;
    challengePeriod = channels[channelId].challengePeriod;
    closingBlock = channels[channelId].closingBlock;
    state = channels[channelId].state;
    sequenceNumber = channels[channelId].sequenceNumber;
    evidence0 = channels[channelId].evidence0;
    evidence1 = channels[channelId].evidence1;
}
