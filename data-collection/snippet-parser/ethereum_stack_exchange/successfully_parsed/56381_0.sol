contract parameterOverflows {

    uint8 selectedCharacter;

    modifier onlyCharacter(uint8 _character) {
        require(_character < 256);
           _;
    }

    function selectCharacter(uint8 _character) public onlyCharacter(_character) {
        selectedCharacter = _character;
    }

}
