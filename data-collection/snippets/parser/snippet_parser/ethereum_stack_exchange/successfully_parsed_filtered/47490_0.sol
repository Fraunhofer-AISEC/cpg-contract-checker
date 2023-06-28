pragma solidity ^0.4.23;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract VideoDummyData is Ownable{

    
    constructor() public {
        
    }

    
    string[3] m_aryVideoIds = 
        ["ZUSPD9zOyJs", "4nqJiBRNQuw", "PLcxE4UkJt0"];


    
    function getVideoIdAt (uint ndx) public view returns(string)
    {
        
        require(ndx < m_aryVideoIds.length);

        return m_aryVideoIds[ndx];
    }
}
