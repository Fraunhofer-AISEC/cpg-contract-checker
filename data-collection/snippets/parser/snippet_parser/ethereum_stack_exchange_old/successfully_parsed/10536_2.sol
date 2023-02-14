contract Factory {

function at(address _addr) private view returns (bytes memory o_code) {
    assembly {
        
        let size := extcodesize(_addr)
        
        
        o_code := mload(0x40)
        
        mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
        
        mstore(o_code, size)
        
        extcodecopy(_addr, add(o_code, 0x20), 0, size)
    }
}

function create(address _addrOfCode) returns (address){
    address retval;
    assembly{
        mstore(0x0, or (0x5880730000000000000000000000000000000000000000803b80938091923cF3 ,mul(_addrOfCode,0x1000000000000000000)))
        retval := create(0,0, 32)
    }
    return retval;
}
}

contract Adder {
uint256 public param;

constructor(){
    param = 5;
}

function add(uint a, uint b) returns (uint){
    return a+b;
}
}

contract Tester {

Adder a;

function Tester(address factory,address adder){
    address cAdr = Factory(factory).create(adder);
    a = Adder(cAdr);
    if(address(a) == 0) throw;
}

function test(uint x, uint y) constant returns (uint){
    return a.add(x,y);
}

function getParam() constant returns (uint){
    return a.param();
}
}
