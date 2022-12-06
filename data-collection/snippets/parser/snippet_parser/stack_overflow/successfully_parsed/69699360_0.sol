contract vault{
    string public vaultKey = "vault";
    string public inputKey = "";
    bool public valid = false;

       constructor(string memory _inputKey) {
        inputKey = _inputKey;
        valid =  keccak256(abi.encodePacked((inputKey))) == keccak256(abi.encodePacked((vaultKey)));
    }
    function getValidity()public returns(bool){
        return valid;
    }
}
