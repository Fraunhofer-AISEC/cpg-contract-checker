contract A {
    address contractBAddress;
    uint256 number;
    modifier onlyB() {
        require(msg.sender == contractBAddress, "caller must be contruct B");
        _;
    }
    constructor(address _contractBAddress) {
        contractBAddress= _contractBAddress;
    }
    function setNumber(uint256 _number) public onlyB {
         number = _number;
}

contract B {
    A a;
    constructor(address _contractAaddress) {
        a = A(_contractAaddress);
    }
    function setNumber(uint256 _number) public {
         a.setNumber(_number);
}
