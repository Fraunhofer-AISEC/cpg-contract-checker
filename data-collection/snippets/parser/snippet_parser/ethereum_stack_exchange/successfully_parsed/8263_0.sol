library l_Intl {
    struct lstore { uint num; }
    function set (lstore storage self, uint _num) internal {
        self.num = _num;
    }
}

contract c_Intl {
    l_Intl.lstore cstore;
    function set (uint _num) { l_Intl.set(cstore, _num); }
}

library l_Pub {
    struct lstore { uint num; }
    function set (lstore storage self, uint _num) {
        self.num = _num;
    }
}

contract c_Pub {
    l_Pub.lstore cstore;
    function set (uint _num) { l_Pub.set(cstore, _num); }
}
