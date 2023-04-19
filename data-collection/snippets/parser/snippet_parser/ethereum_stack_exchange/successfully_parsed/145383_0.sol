contract MainContract {
    event MyEvent(uint256 tokenId);

    function run(uint256 tokenId) {
        emit MyEvent(tokenId);
    }
}

contract CallerContract {

  function callRun(address mainContract, uint256 tokenId) public {
    MainContract(mainContract).run(tokenId);
  }
}
