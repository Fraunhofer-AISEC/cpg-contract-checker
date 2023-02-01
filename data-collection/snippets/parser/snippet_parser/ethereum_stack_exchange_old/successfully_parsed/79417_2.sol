pragma solidity 0.5.16;

contract Ownable {

    address private _owner;

    modifier onlyOwner  {
        require(msg.sender == _owner);
        _;
    }

    constructor () internal {
        _owner = msg.sender;
    }

    function changeOwner(address newOwner) public onlyOwner {
        _owner = newOwner;
    }

    function owner() public view returns(address) {
        return _owner;
    }
}
