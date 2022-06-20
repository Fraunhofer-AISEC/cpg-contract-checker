pragma solidity >=0.8.0 <0.9.0;

import '@openzeppelin/contracts/proxy/utils/Initializable.sol';

contract ClientBase is Initializable{

    address payable  deployer;
    address public oracle_sc_address;
    address public reputation_SC_address;

    string public uuid_receiver;
    string public uuid_task;

    uint  public target_cat;
    uint  public target_score;
    uint  public max_cat; 
    uint  public max_cat_per_vote;
    uint  public num_experts;
    uint  public max_revisions;

    function initialize (address[] calldata addresses, string[2] calldata uuids, uint[2] calldata target_info, uint[2] calldata vote_costraints,uint [2] calldata evaluation_info)
    public initializer
    {

        max_cat=vote_costraints[0];
        max_cat_per_vote=vote_costraints[1];
        deployer=payable(addresses[0]);
        oracle_sc_address = addresses[1];
        reputation_SC_address=addresses[2]; 

        uuid_receiver=uuids[0];
        uuid_task=uuids[1];

        target_cat=target_info[0];
        target_score=target_info[1];

        num_experts=evaluation_info[0];
        max_revisions=evaluation_info[1];

    }

}
