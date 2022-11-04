pragma solidity ^0.8.0;

contract MyContract {
    function uniswapV2Call(address sender, uint amount0, uint amount1, bytes calldata data) external {
    }
    
    function passArray() external {
        bytes memory data = abi.encode([
            address(0x33),
            address(0x44)
        ]);
        this.uniswapV2Call(address(0x233), 1, 0, data);
    }
    
    function passFuncionCall() external {
        bytes memory data = abi.encodePacked(
            bytes4(keccak256('anotherfunction(uint256,address)')), 
            abi.encode(
                123, 
                address(0x45)
            )
        );
        this.uniswapV2Call(address(0x233), 1, 0, data);
    }
}
