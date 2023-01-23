function __callback(bytes32 _oraclizeID, string _result) {
      require(msg.sender == oraclize_cbAddress());
      Value = mul(parseInt(_result),1000);
    }
