pragma solidity 0.4.19;

contract Owned {

    address public owner;

    function Owned() public {
        owner = msg.sender;
    }

    function changeOwner(address newOwner) public returns(bool success) {
        require(msg.sender == owner);
        owner = newOwner;
        return true;
    }
}

contract HubInterface {
    function deployStub() public returns(address newStub);
    function isHub() public pure returns(bool isIndeed);
    function getUserContractAtRow(address user, uint row) public view returns(address userContract);
}

contract Stub is Owned{

    address public owner;
    HubInterface hub;

    function Stub() public {
        hub = HubInterface(msg.sender);
        require(hub.isHub());
    }
}

contract Hub is HubInterface, Owned {

    mapping(address => address[]) userContracts;

    function deployStub() public returns(address newStub) {
        Stub s = new Stub();
        userContracts[msg.sender].push(address(s));
        return address(s);
    }

    function isHub() public pure returns(bool isIndeed) {
        return true;
    }

    function getUserContractAtRow(address user, uint row) public view returns(address userContract) {
        return userContracts[user][row];
    }
}
