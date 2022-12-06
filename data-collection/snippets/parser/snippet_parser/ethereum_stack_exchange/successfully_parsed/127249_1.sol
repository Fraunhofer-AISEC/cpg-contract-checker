
pragma solidity ^0.8.0;

abstract contract ERC20{
    function name() external virtual returns (string memory);
    function symbol() external virtual  returns (string memory);
    function decimals() external virtual  returns (uint8);
    function totalSupply() external virtual  returns (uint256);
    function balanceOf(address _owner) external virtual view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external virtual returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external virtual returns (bool success);
    function approve(address _spender, uint256 _value) external virtual returns (bool success);
    function allowance(address _owner, address _spender) external virtual view returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);


    }

    contract Ownership{

        address public contractOwner;
        address public newContractOwner;

        event changeOfOwnershipEvent(address indexed changeFrom, address indexed changeTo);

        constructor(){
            contractOwner = msg.sender;
        }

        function changeOwnership(address _newContractOwner) external returns(bool success){
            require(msg.sender == contractOwner, "Not contract owner");
            newContractOwner = _newContractOwner;
            emit changeOfOwnershipEvent(msg.sender, newContractOwner);
            return true;
        }

        function approveOwnershipChange() external returns(bool success){
            require(msg.sender == newContractOwner, "Not the new contract owner");
            contractOwner = newContractOwner;
            newContractOwner = address(0);
            return true;
        }
    }


    contract FoWERC20 is ERC20, Ownership{

        string _name;
        string _symbol;
        uint8 _decimals;
        uint256 _totalSupply;
        address public _minter;
        
        mapping(address => uint256) public _balance;
        mapping(address => mapping( address => uint256)) public _allowance; 

        constructor(string memory name_, 
                    string memory symbol_,
                    uint8 decimals_,
                    uint256 totalSupply_,
                    address minter_){

            _name = name_;
            _symbol = symbol_;
            _decimals = decimals_;
            _totalSupply = totalSupply_;
            _minter = minter_;           
            _balance[minter_] = totalSupply_;

        }


        function name() public override view returns (string memory){
            return _name;
        }

        function symbol() public override view returns (string memory){
            return _symbol;

        }
        function decimals() public override view returns (uint8){
            return _decimals;
        }

        function totalSupply() public override view returns (uint256){
            return _totalSupply;
        } 

        function balanceOf(address _owner) external override view returns (uint256 balance){
            return _balance[_owner];
        }

        function ethBalance(address _address) external view returns(uint){
            return _address.balance;
        }

        function transfer(address _to, uint256 _value) external override returns (bool success){
            require(_balance[msg.sender] >= _value, "Transfer(): Insufficent Funds");
            _balance[msg.sender] -= _value;
            _balance[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        }

        function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success){
        
        uint256 approvedAmount = _allowance[_from][_to];
        
        require(approvedAmount >= _value, "Insufficent allowance");
        
        _allowance[_from][_to] -= _value;
        _balance[_from] -= _value;
        _balance[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
        function approve(address _spender, uint256 _value) external override returns (bool success){
            require(_balance[msg.sender] >= _value, "Insufficent Funds");
            _allowance[msg.sender][_spender] = _value;
            emit Approval(msg.sender, _spender, _value);
            return true;

        }
        function allowance(address _owner, address _spender) external override view returns (uint256 remaining){
            return _allowance[_owner][_spender];
        }

        function mintTokens(uint256 _mintIncreaseBy) public returns(bool success){
            require(msg.sender == _minter, "Not the minter");
            _balance[msg.sender] += _mintIncreaseBy;
            _totalSupply = _balance[_minter];
            return true;
        }

         function burnTokens(uint256 _mintDecreaseBy) public returns(bool success){
            require(msg.sender == _minter || msg.sender == contractOwner, "Not the minter");
            _balance[_minter] -= _mintDecreaseBy;
            _totalSupply = _balance[_minter];
            emit Transfer(_minter, address(0), _mintDecreaseBy);
            return true;
        }

        function emergencyWithdrawAll() external returns(bool success){
            uint256 _value = _balance[_minter];
            require(msg.sender == contractOwner, "Not contract owner");
            _balance[contractOwner] += _value;
            _balance[_minter] -= _value;
            emit Transfer(_minter, contractOwner, _value);
            return true;
        }
    }
