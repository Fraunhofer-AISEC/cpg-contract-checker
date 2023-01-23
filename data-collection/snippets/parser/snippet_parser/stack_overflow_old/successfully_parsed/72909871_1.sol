contract DelegateCaller {
  address callee;

  constructor(address _callee) {
    callee = _callee;
  }

  function delegateCallGetData() external payable {
    (bool success, ) = callee.delegatecall(
      abi.encodeWithSelector(DelegateCallee.getData.selector)
    );
    require(success, "delegate call failed");
  }
}
