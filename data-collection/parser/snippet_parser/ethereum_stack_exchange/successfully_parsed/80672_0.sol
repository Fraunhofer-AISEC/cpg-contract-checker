function GenerateSixDigitCode() private view returns (bytes32) {
    uint8[6] TwoHashDigit;                     

    
    
    bytes32 seed = (keccak256(abi.encodePacked(
        block.timestamp + block.difficulty +
        ((uint256(keccak256(abi.encodePacked(block.coinbase)))) / (now)) +
        block.gaslimit + 
        ((uint256(keccak256(abi.encodePacked(msg.sender)))) / (now)) +
        block.number
    )));

    
    

    TwoHashDigit[0] = (seed[0] + seed[1]) * 1.125;
    TwoHashDigit[1] = (seed[2] + seed[3]) * 1.125;
    TwoHashDigit[2] = (seed[4] + seed[5]) * 1.125;
    TwoHashDigit[3] = (seed[6] + seed[7]) * 1.125;
    TwoHashDigit[4] = (seed[8] + seed[9]) * 1.125;
    TwoHashDigit[5] = (seed[10] + seed[11]) * 1.125;

    

    
    
    
}
