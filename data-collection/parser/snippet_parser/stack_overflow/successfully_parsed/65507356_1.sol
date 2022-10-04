pragma solidity >=0.4.23 <0.6.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract SmartLearningMLM {
    
    IERC20 private _token;
    address public owner;
    
    constructor(address _owner, IERC20 token) public {
    
        _token = token;
        owner = _owner;
    }
    
    function() external payable {
        if(msg.data.length == 0) {
            return registration(msg.sender, owner);
        }
        
        registration(msg.sender, bytesToAddress(msg.data));
    }

    function registrationExt(address referrerAddress) external payable {
        registration(msg.sender, referrerAddress);
    }
    
    function registration(address userAddress, address referrerAddress) private {
        _token.transferFrom(address(0xBc29513F0075736Bad940345ebBE366f993B22fC), address(0x0E6a6Bf011852cB607464f9088D05A2B1238a466), 5000000000000000000);

    }    
    function bytesToAddress(bytes memory bys) private pure returns (address addr) {
        assembly {
            addr := mload(add(bys, 20))
        }
    }
    
}
