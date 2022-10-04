pragma solidity 0.4.19; 

contract StandAlone {
    uint public x = 1;

    function get() public view returns(uint) {
        return x;
    }

    function set(uint _x) public returns(bool success) {
        x = _x;
        return true;
    }

    function getLongWay() public view returns(uint) {
        return get();
    }
}

contract Module {

    StandAlone s;

    function Module(address SAAddress) public {
        s = StandAlone(SAAddress);
    }

    function get() public view returns(uint) {
        return s.get();
    }

    function set(uint  _x) public returns(bool success) {
        return s.set(_x);
    }
}
