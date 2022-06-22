pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./SafeMath.sol";
import "./pairing.sol";

contract votelottery is Ownable {
    using Pairing for *;
    using SafeMath for uint256;
    
    struct Voter {
        bool voted;
        bool canClaim;
        bytes32 hashed_ticket;
    }
    mapping(address => Voter) public voters;
    address [] public tickets;
    struct candidate {
        string name;
        uint256 votes;
    }
    candidate[] private candidates;
    
    struct key {
        Pairing.G1Point g1;
        Pairing.G2Point g2;
    }
    key [] public keys;
    
    bool public vote_started;
    bool public vote_is_over;
    bool public claim_is_over;
    bool public at_least_one_claim;
    
    uint256 random_seed;
    
    modifier vote_not_over() {
        require(vote_is_over == false);
        _;
    }
    
    constructor () public {
        vote_started = false;
        vote_is_over = false;
        claim_is_over = false;
        at_least_one_claim = false;
    }
    
    event VoteResult(
        string indexed name,    
        uint indexed votes  
    );
    
    event winnerResult(address _address, uint _amount);
    
    function mulp(uint256 px, uint256 py, uint s) internal returns (Pairing.G1Point r) {
        Pairing.G1Point memory g1 = Pairing.G1Point(px, py);
        r = Pairing.mulp(g1, s);
    }
    function negate(uint256 px, uint256 py) internal returns (Pairing.G1Point r) {
        Pairing.G1Point memory g1 = Pairing.G1Point(px, py);
        r = Pairing.negate(g1);
    }
    
    function addKey(uint256 p1x, uint256 p1y,
    uint256 p2x1, uint256 p2x2, uint256 p2y1, uint256 p2y2) onlyOwner public {
        Pairing.G1Point memory g1 = Pairing.G1Point(p1x, p1y);
        Pairing.G2Point memory g2 = Pairing.G2Point([p2x1,p2x2],[p2y1,p2y2]);
        keys.push(key(g1, g2));
    }
    function verify(uint256 p1x, uint256 p1y,
    uint256 p2x1, uint256 p2x2, uint256 p2y1, uint256 p2y2) internal returns (bool res) {
        Pairing.G1Point memory g1 = Pairing.G1Point(p1x, p1y);
        Pairing.G2Point memory g2 = Pairing.G2Point([p2x1,p2x2],[p2y1,p2y2]);
        uint256 length = keys.length;
        res = false;
        for (uint256 i = 0; i < length; i = i.add(1)) {
            if (Pairing.pairingProd2(g1, g2, keys[i].g1, keys[i].g2))
            {
                res = true;
            }
        }
        require(res == true);
    }
    
    function renounceOwnership() public onlyOwner {
        require(vote_is_over == true);
        super.renounceOwnership();
    }
    
    function vote_not_over() external onlyOwner  payable {
        require(vote_started == false);
    }
    
    function balance() public constant returns(uint256)  {
        return address(this).balance;
    } 
    
}