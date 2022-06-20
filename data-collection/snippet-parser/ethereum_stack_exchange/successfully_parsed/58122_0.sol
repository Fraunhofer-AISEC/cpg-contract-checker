pragma solidity 0.4.24;

contract Owned {

    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function changeOwner(address newOwner) public onlyOwner returns(bool success) {
        owner = newOwner;
        return true;
    }
}

contract Keeper is Owned {

    bytes32[] public array;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function appendArray(bytes32 value) public onlyOwner returns(uint arrayLength) {
        uint length = array.push(value);
        return length;
    }
}

contract Replacable is Owned {

    Keeper keeper;

    constructor() public {
        keeper = new Keeper();
    }

    function getKeeperAddress() public view returns(address keeperAddress) {
        return address(keeper);
    }

    function appendInKeeper(bytes32 value) public onlyOwner returns(uint arrayLength) {
        return keeper.appendArray(value);
    }

    function inspectInKeeper(uint row) public view returns(bytes32 value) {
        return keeper.array(row);
    }

    function appointNewReplacable(address newContract) public onlyOwner returns(bool success) {
        return keeper.changeOwner(newContract);
    }

}
