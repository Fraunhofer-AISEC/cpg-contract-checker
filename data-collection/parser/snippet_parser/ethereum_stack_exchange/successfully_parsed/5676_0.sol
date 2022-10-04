contract Factory {
    function create(bytes code) returns (address addr){
        assembly {
            addr := create(0,add(code,0x20), mload(code))
            jumpi(invalidJumpLabel,iszero(extcodesize(addr)))
        }
    }
}

contract Adder {
    function add(uint a, uint b) returns (uint){
        return a+b;
    }
}

contract Tester {
    Adder a;

    function Tester(address factory){
        a = Adder(Factory(factory).create(
        hex"606060405234610000575b60ad806100186000396000f30060606040526000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063771602f714603c575b6000565b34600057605d60048080359060200190919080359060200190919050506073565b6040518082815260200191505060405180910390f35b600081830190505b929150505600a165627a7a723058205d7bec00c6d410f7ea2a3b03112b597bb3ef544439889ecc1294a77b85eab15e0029"
            ));
        if(address(a) == 0) throw;
    }

    function test(uint x, uint y) constant returns (uint){
        return a.add(x,y);
    }
}
