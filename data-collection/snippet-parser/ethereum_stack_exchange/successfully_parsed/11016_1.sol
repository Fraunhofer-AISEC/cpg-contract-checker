import "./example1.sol";

contract example2 is example1 {
    address public example1Address = 0xc3c695f67520a07b7745a7e6fb7b560f77d6154b;

    function setOriginContract(address _example1Address) public onlyOwner returns(bool) {
    example1Address = _example1Address;
    return true;
}



function exampleFunction()public returns(uint){
    example1Contract example1 = example1Contract[example1Address];
    return example1.Example1Function();
}
}