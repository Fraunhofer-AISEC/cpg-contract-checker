library MyLibrary_1
{
    function MyLibrary_1()
    {

    }

    function TestFunction() public
    {
        uint8 value = 5 + 5;
    }
}

library MyLibrary_2
{
    function MyLibrary_2()
    {

    }

    function TestFunction() public
    {
        uint8 value = 5 + 5;
    }
}

contract MyContract
{
    function MyContract()
    {

    }

    function MyContract_function() public
    {
        MyLibrary_1.TestFunction();
        MyLibrary_2.TestFunction();
    }

    function() 
    {
        throw;
    }
}   
