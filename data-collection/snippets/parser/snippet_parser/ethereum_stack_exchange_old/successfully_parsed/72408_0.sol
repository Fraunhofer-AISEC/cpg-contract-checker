pragma solidity ^0.5.0;

contract Test
{
    uint public m_ReceivedWei;

    function()
        external payable
    {
        m_ReceivedWei += msg.value;
    }

}
