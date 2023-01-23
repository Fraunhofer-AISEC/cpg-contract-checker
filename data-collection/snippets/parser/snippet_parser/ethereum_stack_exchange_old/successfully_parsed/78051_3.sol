contract A {
    B b;

    constructor(B _b) public {
        b = _b;
    }  

    function() external payable {
        (bool success, bytes memory result) = address(b).call.value(msg.value)("");

        revert();
    }
}

contract B {
    function() external payable {
        selfdestruct(msg.sender);
    }

    function alive() public pure returns (bool) {
        return true;
    }
}
