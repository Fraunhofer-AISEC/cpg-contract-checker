contract contractFactory{

    event contractCreated(string name, address institution, address parent);

    function createContract(
        string _name,
        address head,
        address creator,
        address[] _Members)
    public returns(address){

        Contracts  ContractAddress = new Contracts(_name , head , creator , _Members);
        emit contractCreated(_name,address(ContractAddress), creator);
        return address(ContractAddress);
    }
}

contract Contracts{

    function  dosomthing(){}
}
