function set(bytes32 objName, uint obja, uint objb, uint objc) public {
    Obj storage obj = objs[objName];

    obj.a = uint32(obja);
    obj.b = uint32(objb);
    obj.c = uint32(objc);
}
