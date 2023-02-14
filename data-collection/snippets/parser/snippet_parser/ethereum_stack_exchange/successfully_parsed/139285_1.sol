
interface HelloInterface {
    function set(uint x) external;
    function get() external view returns (uint);
}

contract Main {

    HelloInterface helloContract = HelloInterface(0xf8e81D47203A594245E36C48e151709F0C19fBe8);

    function setHelloInt(uint v) public{
       helloContract.set(v);
    }

}
