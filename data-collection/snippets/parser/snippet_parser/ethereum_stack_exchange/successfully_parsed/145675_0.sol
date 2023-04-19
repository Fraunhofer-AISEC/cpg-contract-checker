function createPatientProfile(Patient calldata userInput) external {

    uint256 length = userInput.identifier.length;
    for (uint256 i = 0; i < length; i+=1) {
        profiles[msg.sender].identifier.push(
            Identifier(userInput.identifier[i].assigner,
            userInput.identifier[i].period, userInput.identifier[i].system,
            userInput.identifier[i].type_, userInput.identifier[i].use,
            userInput.identifier[i].value)
        );
    }
}
  
