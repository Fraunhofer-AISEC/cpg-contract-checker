contract Smartcontract{
    address owner;
    mapping (address => uint256) charge;

    function Smartcontracter() public {
        owner = msg.sender;
    }

    function receiverSetPrice (uint256 _value) public{

        charge[msg.sender] = _value;
    }

    function sendether(address _to) public payable{
        require(msg.value >= charge[_to]);
        _to.transfer(msg.value);
    }
    function checkReceiverAmount(address _to) constant public returns (uint256){
        return charge[_to];
    }
}
