contract Delegate{

    uint public x;

 
    function add(uint a, uint b)public{

        x = a + b;    
    }

    fallback() external{
       x = 123;
    }

}

contract Test{
    uint public x;


    function add(address _a) public
     {
       _a.delegatecall(abi.encodeWithSignature("add(uint,uint)", 10, 5));
       
    }

}
