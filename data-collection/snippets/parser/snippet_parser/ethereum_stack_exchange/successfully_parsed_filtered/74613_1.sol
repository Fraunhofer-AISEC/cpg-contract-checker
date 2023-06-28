pragma solidity ^0.5.1;

contract interaction_2{
    string public get_user_prediction;
    function getValue (address addr)public returns (string memory){ 
        interaction_1 b = interaction_1(addr);
        return get_user_prediction = b.get_user_input();
    }
}
contract interaction_1 {
    function user_input (string memory team_1)public payable;
    function get_user_input()public returns(string memory);
}
