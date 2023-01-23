pragma solidity 0.4.24;

contract MyContract {
    struct Obj {
        uint32 a;
        uint32 b;
        uint32 c;
    }

    mapping(string => Obj) internal objs;

    function set1(string objName, uint256 obja, uint256 objb, uint256 objc) external {
        Obj memory obj;
        obj.a = uint32(obja);
        obj.b = uint32(objb);
        obj.c = uint32(objc);
        objs[objName] = obj;
    }

    function set2(string objName, uint256 obja, uint256 objb, uint256 objc) external {
        objs[objName].a = uint32(obja);
        objs[objName].b = uint32(objb);
        objs[objName].c = uint32(objc);
    }
}
