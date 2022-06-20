pragma solidity ^0.4.13;

contract Receiver {
    event Log(address addr, uint val);
    function onTokenReceived(address from, uint val) 
    returns (bool) {
        Log(from, val);
        return true;
    }
}

contract FallbackReceiver {
    event Log(uint x);
    function () {
        Log(uint8(msg.data[0]));
    }
}

contract NonReceiver {}

contract Sender {
    Receiver rec = new Receiver();
    address fallbackRec = address(new FallbackReceiver());
    address nonRec = address(new NonReceiver());
    address a = 0x1;
    uint u = 1;

    function test1() {
        rec.onTokenReceived(a, u);
    }
    function test2() {
        address(rec).call(bytes4(sha3("onTokenReceived(address,uint256)")), a, u);
    }
    function test3() {
        Receiver(fallbackRec).onTokenReceived(a, u);
    } 
    function test4() {
        fallbackRec.call(bytes4(sha3("onTokenReceived(address,uint256)")), a, u);
    } 
    function test5() {
        Receiver(nonRec).onTokenReceived(a, u);
    }
    function test6() {
        nonRec.call(bytes4(sha3("onTokenReceived(address,uint256)")), a, u);
    } 
}
