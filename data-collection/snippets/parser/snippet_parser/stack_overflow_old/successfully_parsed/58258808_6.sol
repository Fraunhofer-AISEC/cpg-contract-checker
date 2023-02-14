contract Greeter{

    string greeting;

    function greeter(string memory _greeting) public{
        greeting = _greeting;

    }

    function greet() public returns(string memory)
    {
        return greeting;
    }

}
