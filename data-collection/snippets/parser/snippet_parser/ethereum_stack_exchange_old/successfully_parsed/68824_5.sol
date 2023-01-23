contract HelloUniverse {

  HelloWorld helloWorldContract; 

  constructor(address helloWorldContractAddress) public {
      helloWorldContract = HelloWorld(helloWorldContractAddress);
  }

  function talk() public view returns(string memory) {
    return helloWorldContract.response();
  }
}
