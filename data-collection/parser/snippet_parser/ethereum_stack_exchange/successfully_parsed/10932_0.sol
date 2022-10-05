   pragma solidity ^0.4.6;

contract MyContract {
    string public a;
    
    function MyContract() {
        a = "0.12312317314571638713891378174163782169246891247193811231231731";
    }

    function bytesToUInt(uint v) constant returns (uint ret) {
    if (v == 0) {
        ret = 0;
    }
    else {
        while (v > 0) {
            ret = uint(uint(ret) / (2 ** 8));
            ret |= uint(((v % 10) + 48) * 2 ** (8 * 31));
            v /= 10;
        }
    }
    return ret;
}

    function get() constant returns(string){
        return a;
    }
}
