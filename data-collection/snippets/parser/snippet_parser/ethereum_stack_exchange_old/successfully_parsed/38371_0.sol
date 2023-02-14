contract Caller {
    address public callee;

    function Caller(address _callee) {
        callee = _callee;
    }

    function delegate() {
        callee.delegatecall(bytes4(keccak256("call()")));
    }
}

contract Callee {
    function call() {
        Log(msg.sender);
    }
    event Log(address sender);
  }
