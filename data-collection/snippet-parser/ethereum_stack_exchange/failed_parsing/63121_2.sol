
address payable[] public players;
...

players=new address payable [](0);
...

function allplayers() public view returns(address payable[] memory) {
