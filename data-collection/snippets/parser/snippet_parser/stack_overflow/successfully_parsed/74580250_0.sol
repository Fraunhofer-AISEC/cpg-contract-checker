
pragma solidity 0.8.17;

import "./contractone.sol" ;

contract contracttwo
{
      contractone[] public deploy ;

    function contwo() public
    {  deploy.push(new contractone());  
    }
}
