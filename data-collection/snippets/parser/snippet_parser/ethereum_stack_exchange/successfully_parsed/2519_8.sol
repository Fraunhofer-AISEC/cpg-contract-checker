    
    pragma solidity ^0.8.7;
    contract stringtobytes{
        function set(string memory  _a)public pure returns(bytes memory){
            return bytes(_a);
        } 
         function set1(bytes memory  _a)public pure returns(string  memory){
            return string(_a);
        } 

}
