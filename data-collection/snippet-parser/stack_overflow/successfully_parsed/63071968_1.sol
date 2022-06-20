interface IContractA {

    struct User {
        address addr;
    }
    function getUser(aaddress addr) external view returns (User memory user);
}

contract contractB{

    function getUserFromContractA(address addr) public view
        returns (IContractA.User memory user)
    {
      ContractA = IContractA(addrContractA);
      user = ContractA.getUser(addr);
    }
}
