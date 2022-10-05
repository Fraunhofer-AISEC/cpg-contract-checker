contract B {
    string public name="Joe";

    function modify(bytes memory b) public {
        name=string(b);
    }

}

contract A {

    string public name="Kara";

    function caller(address addr, string memory s) public {
        (bool success, bytes memory returnData) = addr.delegatecall(abi.encodeWithSignature("modify(bytes)", s));
        require(success);
    }
}
