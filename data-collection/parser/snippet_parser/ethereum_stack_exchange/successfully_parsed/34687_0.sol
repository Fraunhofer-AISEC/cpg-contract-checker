contract ElephanteumCore is Ownable {

        ElephanteumStorage public eStorage;

        function ElephanteumCore(address _eStorage) public payable {
            eStorage = ElephanteumStorage(_eStorage);     
        }

        function init(bytes32 _name, bytes32 _symbol, uint _supply) public onlyOwner {
            eStorage.setTotalSupply(_supply);
            eStorage.setElephantsRemainingToAssign(_supply);
            eStorage.setName(_name);
            eStorage.setSymbol(_symbol);
        }
}




contract ElephanteumStorage is Ownable {

        bytes32 public name;
        bytes32 public symbol;

        uint public totalSupply;

        uint public elephantsRemainingToAssign;

        function setName(bytes32 _name) onlyOwner external {
            name = _name;
        }

        function setSymbol(bytes32 _symbol) onlyOwner external {
            symbol = _symbol;
        }

        function setTotalSupply(uint _totalSupply) onlyOwner external {
            totalSupply = _totalSupply;
        }

        function setElephantsRemainingToAssign(uint _elephantsRemainingToAssign) onlyOwner external {
            elephantsRemainingToAssign = _elephantsRemainingToAssign;
        } 
}
