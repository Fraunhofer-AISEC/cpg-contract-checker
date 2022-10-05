 contract myToken is ERC20 {
   

   
  function getTime() internal virtual view returns (uint256) {
        return block.timestamp;
    }

}

contract mockMyToken is myToken {
    uint256 public fakeBlockTimeStamp;

    function getTime() internal override(myToken) view returns (uint256) {
        return fakeBlockTimeStamp;
    }

    function _mock_setBlockTimeStamp(uint256 value) public {
        fakeBlockTimeStamp = value;
    }
}
