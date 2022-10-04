

pragma solidity ^0.8.6;

contract Voting{

    address public president;

    mapping(bytes32=>uint) public candidates;

    bytes32[] public names;

    constructor(bytes32[] memory _names) {
        president = msg.sender;
        for(uint idx=0; idx<_names.length; idx++){
            bytes32 name = _names[idx];
            names[idx] = name;
            candidates[name] = 0;
        }
    }

    function vote(bytes32 name) public {
        candidates[name] += 1;
    }

    function declareWinner() public view returns(bytes32){
        require(president==msg.sender);
        bytes32 winner;
        uint votes=0;

        for(uint idx=0; idx<names.length; idx++){
            bytes32 name = names[idx];
            uint _votes = candidates[name];
            if(_votes > votes){
                winner = name;
                votes = _votes;
            }
        }

        return winner;
    }
}
