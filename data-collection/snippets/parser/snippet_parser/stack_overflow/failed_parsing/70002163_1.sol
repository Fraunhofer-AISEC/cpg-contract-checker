pragma ton-solidity ^0.51.0;

interface IPong {
    function get(uint b) external responsible returns (uint);
}

contract Ping {
    uint public result;
    uint public tmp;

    function run(address pong, uint a) public view returns(uint) {
        update(pong, a);
        tvm.accept();
        return a + tmp;
    }

    function update(address pong, uint a) internal pure {
        IPong(pong).get{callback: Ping.onGet}(a);
    }

    function onGet(uint b) external {
        tvm.accept();
        tmp = b;
    }
}
