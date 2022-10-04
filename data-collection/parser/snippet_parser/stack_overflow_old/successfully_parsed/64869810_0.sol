contract Calculator {
    uint public result;

    constructor() public {
       result = 777;   
    }

    function add(uint a, uint b) public returns (uint, address) {
       result = a + b;
       return (result, msg.sender);
    }
}
