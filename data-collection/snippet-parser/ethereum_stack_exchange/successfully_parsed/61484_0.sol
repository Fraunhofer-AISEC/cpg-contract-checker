pragma solidity ^0.4.24;

contract Test {

    event Event(address);
    event TestEvent(uint256);
    event Data(bytes);
    event Data1(bytes);
    function show() public returns(uint256){
        emit Event(msg.sender);
        return 100;
    }

    function test(uint256 a)external returns(bytes){

        emit Data(msg.data);
        emit TestEvent(a);
        return msg.data;

    }
    function caller1(address _addr) {
        emit Data1(abi.encodeWithSelector(bytes4(keccak256("test(uint256)")),100));
        _addr.call(abi.encodeWithSelector(bytes4(keccak256("test(uint256)")),100));
    }
}

contract Call {

    function caller1(address _addr) {
        _addr.call(abi.encodeWithSelector(bytes4(keccak256("test(uint256)")),100));
    }
}
