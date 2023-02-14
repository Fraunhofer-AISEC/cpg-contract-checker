pragma ton-solidity ^0.51.0;

interface IPong {
    function get(uint b) external;
}

contract Ping {
    uint public tmp;

    function run(address pong, uint a) public  { 
        IPong(pong).get(a);
        tvm.accept();
        tmp = a + tmp;        
    }

    function onGet(uint b) external {
        tvm.accept();
        tmp = b + tmp;
    }
}
