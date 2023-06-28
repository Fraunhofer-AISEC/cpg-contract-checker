function createPatientProfile(Patient calldata userInput) external {
    uint256 length = userInput.identifier.length;
    for (uint256 i = 0; i < length; i += 1) {
        Identifier storage identifier = profiles[msg.sender].identifier.push();
        identifier.type_.text = userInput.identifier[i].type_.text;
        identifier.system = userInput.identifier[i].system;
        identifier.value = userInput.identifier[i].value;
        uint256 codingLength = userInput.identifier[i].type_.coding.length;
        for (uint256 j = 0; j < codingLength; j += 1) {
            identifier.type_.coding.push(Coding(
                userInput.identifier[i].type_.coding[j].code,
                userInput.identifier[i].type_.coding[j].display,
                userInput.identifier[i].type_.coding[j].system,
                userInput.identifier[i].type_.coding[j].userSelected,
                userInput.identifier[i].type_.coding[j].version
            ));
        }
    }
}
