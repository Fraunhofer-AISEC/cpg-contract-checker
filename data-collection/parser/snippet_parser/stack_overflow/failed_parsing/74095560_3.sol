contract Test {
    event FirstStage(uint256, uint256, string memory);

    function firstStage(address addr) public returns(uint256, uint256, string memory) {
         

         emit FirstStage(challenge, Mnode, toHex(Hnode));
         return (challenge, Mnode, toHex(Hnode));
     }
}
