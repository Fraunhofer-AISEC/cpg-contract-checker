interface IF { 
    function doSomething() external view returns(uint); 
}

contract Inherit is IF {
    Inherit() public; 
}
