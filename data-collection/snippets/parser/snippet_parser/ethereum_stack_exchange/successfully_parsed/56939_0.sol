    function getBarsOfParticipant() external view returns (uint256[], uint16[], bool[]) {
    uint256[] barIds = participantToBarIds[msg.sender];

    uint256[] memory ids = new uint256[](barIds.length);
    uint16[] memory lengths = new uint16[](barIds.length);
    bool[] memory forSale = new bool[](barIds.length);

    for (uint16 i = 0; i <= barIds.length; i++) {
        Bar storage bar = bars[barIds[i]];
        ids[i] = barIds[i];
        lengths[i] = bar.length;
        forSale[i] = bar.forSale;
    }

    return (ids, lengths, forSale);
}
