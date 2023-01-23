pragma solidity >=0.4.22 <0.6.0;
contract Person {

    
    address private owner;

    
    string private firstName;
    string private lastName;
    string private SID; 

    constructor(string memory _firstName, string memory _lastName, string memory _SID) public {
        owner = msg.sender;
        firstName = _firstName;
        lastName = _lastName;
        SID = _SID;
    }

    modifier checkAccess(){
        require(this.getAccess() == true);
        _;
    }

    function getAccess() public view returns(bool access){
        
        return msg.sender == owner;
    }

    function getFirstName() public view checkAccess returns (string memory _firstName){
        _firstName = firstName;
    }
    function getLastName() public view returns (string memory _lastName){
        _lastName = lastName;
    }
    function getSID() public view returns (string memory _SID){
        _SID = SID;
    }
}
