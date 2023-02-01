library ExampleLib {
    function changeStateVar(uint256[] storage stateVar) public {
        data.push(3);
    }
}

contract ExampleContract {
    ...
    uint256[] public data;
    ...
    function libCallingFunction() public {
        ExampleLib.changeStateVar(data);
    }
    ...
}
