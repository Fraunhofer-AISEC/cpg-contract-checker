pragma solidity >=0.8.0;

contract AbiTest {

    event A(uint);
    event Out(bytes);

    function test() public {
        bytes4 func = bytes4(keccak256("callMe(uint[])"));

        uint[] memory arr = new uint[](3);
        arr[0] = 3;
        arr[1] = 4;

        (bool res, bytes memory data) = address(this).call(abi.encode(func, arr));
        emit Out(data);
        require(res);
    }

    function callMe(uint[] memory array) public {
            emit A(array[0]);
            emit A(array[1]);
    }
}
