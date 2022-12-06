contract Voting {
 struct voter {
   address voterAddress;
   uint256 tokensBought;
   mapping (bytes32 => uint256) tokensUsed;
 }
 mapping (address => voter) public voterInfo;
}
