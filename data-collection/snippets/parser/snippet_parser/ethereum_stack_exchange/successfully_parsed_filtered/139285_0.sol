
interface HelloInterface {
    function set(uint x) public;
    function get() public view returns (uint);
}

contract Main {

    HelloInterface helloContract;

    address hwAddress = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;

    function setHelloInt(uint v) external {
        helloContract = HelloInterface(hwAddress).set(v);
    }

}
