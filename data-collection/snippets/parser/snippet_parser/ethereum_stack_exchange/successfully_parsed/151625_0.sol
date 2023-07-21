function fulfillRandomWords(
    uint256 requestId,
    uint256[] memory randomWords
) internal override {
    uint256 randNumVRFDiceRolls = randomWords[0];
    uint256 randNumVRFDecisions = randomWords[1];
    bytes32 randNumDiceRolls;
    bytes32 randNumDecicions;

    assembly {
        randNumDiceRolls := randNumVRFDiceRolls
        randNumDecicions := randNumVRFDecisions
    }

    round[requestId].diceRolls = alterRandomValue(randNumDiceRolls, 20);
    round[requestId].smartContractDecisions = alterRandomValue(randNumDecicions, 101);

    emit DiceLanded(requestId, round[requestId]);
}

function alterRandomValue(bytes32 randomNum, uint8 modOperatorValue) private pure returns (bytes32){
    bytes32 result;

    for (uint8 i = 0; i < 32; i++) {
        uint8 byteValue = uint8(randomNum[i]);
        uint8 moduloValue = byteValue % modOperatorValue;
        result |= bytes32(uint256(moduloValue)) << (8 * i);
    }
    
    return result;
}
