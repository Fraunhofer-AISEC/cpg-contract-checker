pragma solidity 0.4.23;

contract Owned {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

}

contract Spoke {

    string public storedString;

    event LogSetHubString(address sender, string _string);

    function setString(string _string) public returns(bool success) {
        emit LogSetHubString(msg.sender, _string);
        storedString = _string;
        return true;
    }

}

contract Hub is Owned {

    address[] public spokes;
    mapping(address => bool) public isSpoke;

    event LogNewSpoke(address sender, address spoke);

    constructor() public { owner = msg.sender; }

    function getSpokeCount() public view returns(uint count) { return spokes.length; }

    function newSpoke() public onlyOwner returns(address newContract) {
        Spoke s = new Spoke();
        spokes.push(address(s));
        isSpoke[address(s)] = true;
        emit LogNewSpoke(msg.sender, address(s));
        return address(s);
    }

}
