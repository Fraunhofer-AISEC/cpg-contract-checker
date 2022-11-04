contract ChildContract {

    receive() external payable {}

   function returnSomethingFromThisChild{
   }

}

contract mainContract {

  function deploy_child_in_token_mode(uint _uuid, ITRC20 _token, uint _amount, address payable _receiver) external {

address a =  address(new ChildContract{salt: bytes32(_uuid)}(msg.sender)); 
objectOfChild = perChildInstance.returnSomethingFromThisChild();

        objectOfChild._token.transfer(_receiver,  _amount);
}
