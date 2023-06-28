pragma solidity ^0.4.0;
contract TestcaseResetObject {

    MyObject ob;

    struct MyObject {
        mapping(uint8 => uint) map;
    }

    event Output(uint number);

    function makeNew() {
        ob = MyObject();
        ob.map[0] += 1;
        Output(ob.map[0]);
    }
}
