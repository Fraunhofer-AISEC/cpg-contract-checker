pragma solidity 0.5.1;

contract Pointer {

    struct MyStruct {
        address a;
        bool b;
        uint u;
    }
    mapping(bytes32 => MyStruct) public myStructs;

    event LogActivity(address sender, address a, bool b, uint u);

    function emitter(MyStruct storage s) internal {
        emit LogActivity(msg.sender, s.a, s.b, s.u);
    }

    function callMe(bytes32 key) public {
        emitter(myStructs[key]);
    }

    function setter(bytes32 key, address a, bool b, uint u) public {
        MyStruct storage s = myStructs[key];
        s.a = a;
        s.b = b;
        s.u = u;
    }
}
