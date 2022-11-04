contract Banker {
    string name;
    address[] public contracts;

    constructor(string _name) public {
        name = _name;
    }
    
    function createMoney (string _name, string _territory) public{
        Money m = new Money(_name, _territory);
        contracts.push(m);
    }
    
    function howMany() public constant returns (uint){
        return contracts.length;
    }
    
    function showMoney(uint index) public constant returns (address) {
        assert (index < contracts.length);

        
        return contracts[index];
    }

}
