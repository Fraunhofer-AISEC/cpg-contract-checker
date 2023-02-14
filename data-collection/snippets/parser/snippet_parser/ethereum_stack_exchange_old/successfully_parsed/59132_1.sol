contract A {
    function deployB() public payable returns (address) {
        B instance = (new B).value(msg.value)(42); 
        return instance;
    }
}

contract B {
    uint public num;
    constructor(uint _num) public payable {
        require(msg.value > 0); 
        num = _num; 
    }
}
