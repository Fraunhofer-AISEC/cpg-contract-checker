pragma solidity 0.6.12;


contract testbyte {

    function sendBytes(bytes calldata _data) external pure returns (address) {
        (uint amountIn, uint amountOut, address pool) = abi.decode(_data, (uint, uint, address));

        return pool;


    }
}
