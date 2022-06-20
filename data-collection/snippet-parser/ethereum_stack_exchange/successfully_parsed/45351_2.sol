pragma solidity ^0.4.20;

contract ContractA {
    uint num;

    function ContractA(uint n) public {
        num = n;
    }

    function get() public view returns(uint) {
        return num;
    }
}

contract ContractB {

    struct Info {
        ContractA ainstance;
    }
    mapping(uint => Info) infoMapping;
    uint length;

    function ContractB() public {

    }

    function create(uint n) public {
        infoMapping[length] = Info(
            new ContractA(n)
        );
        length++;
    }

    function get(uint index) public view returns(uint) {
        return infoMapping[index].ainstance.get();
    }

}
