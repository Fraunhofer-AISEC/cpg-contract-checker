function transferToaddress(address payable addressToSend) public{
    addressToSend.transfer(0.5 ether);
}

var response = await this.contract.transferToaddress(vm.userAccountAddress)
    .send({ from: vm.userAccountAddress, gas: vm.gas })
