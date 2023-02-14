

contract Money {
    string name;
    string territory;
    
    constructor(string _name, string _territory) public {
        name = _name;
        territory = _territory;
    }
    
    function moneyName() public constant returns (string){
        return name;
    }
}
