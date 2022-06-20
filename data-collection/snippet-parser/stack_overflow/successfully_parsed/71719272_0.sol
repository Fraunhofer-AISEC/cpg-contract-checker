
pragma solidity >0.8.0;
contract Pong {
    uint public pong_count;
    function ping() public returns (uint){
        pong_count++;
        emit Pinged(this, pong_count);
        return pong_count;
    }
    event Pinged(Pong indexed me, uint count);
    function pong() public returns (uint){
        pong_count++;
        emit Ponged(this, pong_count);
        return pong_count;
    }
    event Ponged(Pong indexed me, uint count);
}
