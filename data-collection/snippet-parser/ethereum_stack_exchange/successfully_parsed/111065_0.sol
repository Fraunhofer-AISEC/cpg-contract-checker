pragma solidity ^0.8.0;

contract MapTest {

struct Pair {
    uint256 token1;
    uint256 token2;
    uint256 breedStart;
    uint256 breedEnd;
}

mapping(address => mapping(uint256 => Pair[])) userPairs; 
mapping(address => uint256) pairCount;
mapping(uint256 => bool) isBreeding;

function getRandom() public view returns(uint256){
    uint256 time = block.timestamp;
    uint256 rand = uint256(keccak256(abi.encodePacked(time)));
    
    return (rand % 360);
}

function breed(uint256 _token1, uint256 _token2) public {
    require (isBreeding[_token1] == false && isBreeding[_token2] == false);

    uint256 breedTime = getRandom();
    uint256 time = block.timestamp;
    
    Pair memory pairTest;
    
    pairTest.breedStart = time;
    pairTest.breedEnd = time + breedTime;
    pairTest.token1 = _token1;
    pairTest.token2 = _token2;
    
    userPairs[msg.sender][pairCount[msg.sender]].push(pairTest);
    isBreeding[_token1] = true;
    isBreeding[_token2] = true;
    
    pairCount[msg.sender]++;
    
}


function getPairData(address _wallet, uint256 _index) public view returns(Pair[] memory){
    return userPairs[_wallet][_index];
}

function getPairMembers(address _wallet, uint _index) public view returns(uint256, uint256, uint256, uint256){
    return (userPairs[_wallet][_index].token1, 
            userPairs[_wallet][_index].token2, 
            userPairs[_wallet][_index].breedStart, 
            userPairs[_wallet][_index].breedEnd);
}
}