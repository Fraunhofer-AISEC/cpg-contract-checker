contract parameterOverflows {

    uint8 public selectedCharacter;

    modifier onlyCharacter(uint _character) {
        require(_character <= 255);
           _;
    }

    function selectCharacter(uint _character) public onlyCharacter(_character) {
        selectedCharacter = uint8(_character);
    }

}
