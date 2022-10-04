pragma solidity ^0.5.12;

library Alireza{

    function comparison(uint a, uint b) view public returns(bool){  
        if(a==b){
            return true;
        }else{
            return false;
        }
    }
}

contract B{

    using Alireza for uint;

    function assessment(uint m, uint n) view public returns(bool){
        return m.comparison(n);
    }
}
