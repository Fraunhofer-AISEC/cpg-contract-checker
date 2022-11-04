interface MyInterface {
    function setv(uint256 vv) external;
    function lastRun() returns (uint256) public;
}


contract MyNewContract {
    address Myaddr = 0x..................;

    function rr(uint256 vv) public
    {
        MyInterface(Myaddr).setv(vv);
        uint256 val = MyInterface(Myaddr).lastRun();
    }
} 
