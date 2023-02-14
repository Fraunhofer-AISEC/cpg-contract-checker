pragma solidity >=0.7.0 <0.9.0;

contract caller {
     
    function caller1(address add,uint256 index)public {        
       add.call(abi.encodeWithSignature("changeValue(uint256)",index));
    }
}
