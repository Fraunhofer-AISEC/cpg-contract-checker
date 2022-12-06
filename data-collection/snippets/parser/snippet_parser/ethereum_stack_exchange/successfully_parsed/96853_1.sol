

pragma solidity >=0.7.0 <0.9.0;

library l_Intl {
    struct lstore { uint num; }
    function set (lstore storage self, uint _num) internal {
        self.num = _num+8;
    }

    function setxxx (lstore storage self, uint _num) internal {
        self.num = _num+2;
    }
}

contract c_Intl {
    l_Intl.lstore cstore;
    function setxxx (uint _num) public { l_Intl.setxxx(cstore, _num); }

}

library l_Pub {
    struct lstore { uint numxxx; }
    function set (lstore storage self, uint _num) public{
        self.numxxx = _num;
    }
    function setxxx (lstore storage self, uint _num) internal{
        self.numxxx = _num+2;
    }
}

contract c_Pub {
    l_Pub.lstore cstore;
    function set (uint _num) public { l_Pub.set(cstore, _num); }
    function setxxx (uint _num) public { l_Pub.setxxx(cstore, _num); }
}
