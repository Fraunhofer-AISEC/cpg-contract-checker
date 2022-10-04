pragma solidity >=0.8.0 <0.9.0;

import './ClientBase.sol';

contract ClientETH is  ClientBase{

    address  payable public receiver_addr;
    uint256  public reward;

    function initialize (address[] calldata addresses, string[2] calldata uuids, uint[2] calldata target_info, uint[2] calldata vote_costraints,uint [2] calldata evaluation_info ,uint256 _reward)
    external
    {
        super.initialize(addresses,uuids,target_info,vote_costraints,evaluation_info);
            receiver_addr=payable(addresses[3]);
            reward=_reward;
    }
}
