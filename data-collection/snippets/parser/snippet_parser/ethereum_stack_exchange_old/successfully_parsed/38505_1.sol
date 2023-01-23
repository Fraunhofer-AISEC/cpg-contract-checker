contract Organizations{
    string public name;
    address public owner;
    mapping(address => bool) public membershipRequests;

    function Organizations(string _name, address _owner){
        owner = _owner;
        name = _name;
    }

    function requestMembership() returns(bool success){
        membershipRequests[msg.sender] = true;
        return true;
    }

}
