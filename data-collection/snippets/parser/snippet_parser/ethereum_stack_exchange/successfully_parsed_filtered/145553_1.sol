interface Target {
  function someFunction() external payable;
}

contract MainContract {
  Target public target;

  constructor(address _tragetAddress) {
    target = Target(_targetAddress);
  }
  
  function execute() public {
    uint256 ethAmountToSend = address(this).balance;
    target.someFunction{value:ethAmountToSend}();
  }

}
