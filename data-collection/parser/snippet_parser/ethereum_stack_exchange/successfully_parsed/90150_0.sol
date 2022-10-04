pragma solidity 0.6.12;

interface Interface0 {
    function thisMethodDoesntExist() external;
}

contract Contract1 {
    
    fallback() external payable {
        string memory message;
        uint256 x = gasleft();
        while (x > 0) {
            message = string(abi.encodePacked(uint8(x % 10 + 48), message));
            x /= 10;
        }
        revert(message);
    }
}

contract Contract2 {
    function test(Interface0 contract1) external {
        contract1.thisMethodDoesntExist();
    }
}
