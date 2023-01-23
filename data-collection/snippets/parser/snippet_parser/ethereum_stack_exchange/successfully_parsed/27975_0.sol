 contract ContractProxy {
    address public _owner; 
    address public _targetcontract;
    event CallContract(bool succes);

    function ContractProxy(address target) public {
        _owner = msg.sender;
        _targetcontract = target;
    }

    function callcontract(uint contractgas, address targetu, uint nonce, address user, uint8 v, bytes32 r, bytes32 s, uint amount) public {
        require(_owner == msg.sender);
        if(_targetcontract.call.gas(contractgas)(bytes4(keccak256("targetfunction(address,uint256,address,uint8,bytes32,bytes32,uint256)")), targetu, nonce, user, v, r, s, amount)){
            CallContract(true);
        } else {
            CallContract(false);
        }
    }

    function changetargetaddress(address newaddress) public {
        require(_owner == msg.sender);
        _targetcontract = newaddress;
    }}
