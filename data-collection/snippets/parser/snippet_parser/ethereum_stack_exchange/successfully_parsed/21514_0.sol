contract test{

    function test(address OAddress, bytes32 _name,address _cpty1, address _creator) {

    }

}


contract Factory {
    address[] public newContracts;
    address public creator;
    address public ID;
    bytes32 public Name;
    modifier onlyOwner{require(msg.sender == creator); _;}
    event Print(address _name, address _value);

    function Factory (bytes32 _Name, address _ID){
        creator = msg.sender;  
        Name = _Name;
        ID = _ID;
    }

    function createContract () payable returns (address){
        address newContract = new test(ID,Name,msg.sender,creator);
        newContracts.push(newContract);
        Print(msg.sender,newContract);
        return newContract;
    } 
    function withdrawFee() onlyOwner {
        creator.transfer(this.balance);
    }
}
