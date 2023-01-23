
pragma solidity 0.8.0;

import "https://github.com/Arachnid/solidity-stringutils/blob/master/src/strings.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

contract Test {
    using Strings for *;
    using strings for *;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, getMessage(msg.sender, owner));
        _;
    }

    function test() public onlyOwner {
        
    }

    function getMessage(address _callingAddress, address _owner) private returns(string memory){
        
        string memory _ownerAddress = Strings.toHexString(uint160(uint160(_owner)));
        string memory _calledAddress = Strings.toHexString(uint160(uint160(_callingAddress)));
        
        string memory _firstMessage = "Owner mismatch: ".toSlice().concat(_ownerAddress.toSlice());
        string memory _secondMessage = " != ".toSlice().concat(_calledAddress.toSlice());
        
        string memory _message = _firstMessage.toSlice().concat(_secondMessage.toSlice());
        return _message; 
    } 
}
