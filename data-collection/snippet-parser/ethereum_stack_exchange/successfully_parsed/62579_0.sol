interface ITest
{
    function check()
        external;
}

contract Test is ITest
{
    address private admin;

    constructor()
        public
    {
        admin = msg.sender;
    }

    modifier onlyAdmin
    {
        assert(msg.sender == admin);
        _;
    }

    function check()
        external onlyAdmin
    {
        
    }
}

contract OtherTest
{
    ITest private test;

    constructor(
        address testAddress
    )
        public
    {
        test = ITest(testAddress);
        test.check();
    }
}
