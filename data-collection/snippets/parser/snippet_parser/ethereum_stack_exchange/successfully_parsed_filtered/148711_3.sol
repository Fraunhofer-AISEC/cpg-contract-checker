
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract VidarCashCard is Ownable{
    address public currentOwner;
    bool public ownerVerfied;

    constructor() {
        currentOwner = msg.sender;
        ownerVerfied = false;
    }
    
    modifier onlyCurrentOwner {
        string memory errorMessage = string(abi.encodePacked("Only the current owner (", addToString(currentOwner), ") can call this function.", addToString(msg.sender)));
        require(msg.sender == currentOwner, errorMessage);
    _;
    }

    

    
function addToString(address _address) internal pure returns (string memory) {
    bytes memory result = new bytes(42);
    result[0] = '0';
    result[1] = 'x';
    for (uint i = 0; i < 20; i++) {
        uint8 value = uint8(uint160(address(_address)) / (2**(8*(19-i))));
        uint8 highNibble = uint8(value) / 16;
        uint8 lowNibble = uint8(value) - 16 * highNibble;
        result[2+2*i] = char(highNibble);
        result[3+2*i] = char(lowNibble);            
    }
    return string(result);
}

    function char(uint8 b) private pure returns (bytes1)  {
        if (b < 10) return bytes1(uint8(bytes('0')[0]) + b);
        else return bytes1(uint8(bytes('a')[0]) + b - 10);
    }

     receive() external payable {
            
    }
    
    function getCurrentOwner() public view returns (address) {
        return currentOwner;
    }


    function verifyOwnership() public onlyOwner {
        ownerVerfied =true;
    }
    

    

}
