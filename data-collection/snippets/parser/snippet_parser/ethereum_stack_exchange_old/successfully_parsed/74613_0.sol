pragma solidity ^0.5.1;
contract interaction_1 {

    string public description;
    string public user_prediction;
    uint public amount;
    event teamAccepted(string team_1);


    function user_input (string memory team) public payable {
           user_prediction = team;
           emit teamAccepted(user_prediction);

    }
    function get_user_input()view public returns(string memory) {
        return user_prediction;
    }

}

contract interaction_2 {
    function getValue (address addr)public returns (string memory);
}
