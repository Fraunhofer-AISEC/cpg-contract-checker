`

pragma solidity ^0.8.13;

contract calculator{
    int result;

    function add(int a,int b) public {
            result = a+b;
    }
     function sub(int a,int b) public {
            result = a-b;
    }
     function mul(int a,int b) public {
            result = a*b;
    }
     function div(int a,int b) public {
         require(b!=0,"B should not be 0!");
            result = a/b;
    }

    function getResult()public view returns (int) {
        return result;
    }
}`
