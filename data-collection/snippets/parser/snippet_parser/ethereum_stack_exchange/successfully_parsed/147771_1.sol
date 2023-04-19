interface OracleInterfacehere{
 function requestVolumeData(string memory _jobId, string memory addrsss, address callBackContract, bytes4 functionSelector) external returns (bytes32) ;
}


 function requestingdataFromOracle(string memory _jobId, string memory addrsss, address _smartcontract2) public  {
      OracleInterfacehere OracleOwnerGuard = OracleInterfacehere(_smartcontract2);
      OracleOwnerGuard.requestVolumeData(_jobId, addrsss,address(this), this.fulfill.selector);
 }

  function fulfill(
    bytes32 _requestId,
    bool _status
) public recordChainlinkFulfillment(_requestId) {
    status = _status;
}
