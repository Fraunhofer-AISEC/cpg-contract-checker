

pragma solidity >=0.7.0 <0.9.0;

contract SendEther
{
    function sendAmount() payable public
    {
        address _to = 0x90E3EC58Eb437204ad071339d6CE97740e7eadd0;
        payable(_to).transfer(msg.value);
    }
}
