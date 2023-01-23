function stateChecker(bytes32 state) public view returns
(bytes4[] calldata allowedFunctions)
{
    return stateFunction[state];
}
