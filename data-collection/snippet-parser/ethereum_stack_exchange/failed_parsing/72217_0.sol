  uint256 constant DELAY = 60*10;
  event Log(string result);

  function __callback(bytes32 _queryID,string memory result,bytes memory _proof)public
  {
    emit Log(result);
  }

  function update()public payable{
    oraclize_query(
        DELAY,
        "URL",
        "json(https://api.coinbase.com/v2/prices/ETH-USD/spot).data.amount"
    );

}
