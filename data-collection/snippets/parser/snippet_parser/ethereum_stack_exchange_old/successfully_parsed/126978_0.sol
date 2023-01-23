
pragma solidity ^0.8.0;

abstract contract ERC20{
    function name() external virtual view returns (string memory);
    function symbol() external virtual view returns (string memory);
    function decimals() external virtual view returns (uint8);
    function totalSupply() external virtual view returns (uint256);
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

        constructor(){
            contractOwner = msg.sender;
        }

        function changeOwnership(address _newContractOwner) external returns(bool success){
            require(msg.sender == contractOwner, "Not contract owner");
            _newContractOwner = newContractOwner;
            return success;
        }

        function approveOwnershipChange() external returns(bool success){
            require(msg.sender == newContractOwner, "Not the new contract owner");
            newContractOwner = contractOwner;
            return success;
        }
    }


    contract FullContact is ERC20, Ownership{

        constructor(string memory name_, 
                    string memory symbol_,
                    uint8 decimals_,
                    uint256 totalSupply_ ){
        }

        string public _name;
        string _symbol;

        uint8 _decimals;
        uint256 _totalSupply;

        mapping(address => uint256) _balance;
        mapping(address => mapping( address => uint256)) _allowance; 
        mapping(address => uint256) minter;


        function name() external override returns (string memory){
            _name = "Fog Of War";
            return _name;
        }

        function symbol() external override returns (string memory){
            _symbol = "FOW";
            return _symbol;

        }
        function decimals() external override returns (uint8){
            _decimals = 18;
            return _decimals;
        }

        function totalSupply() external override returns (uint256){
            _totalSupply = 100000000;
            return _totalSupply;
        } 

        function balanceOf(address _owner) external override view returns (uint256 balance){
            return _balance[_owner];
        }

        function transfer(address _to, uint256 _value) external override returns (bool success){
            require(_balance[msg.sender] >= _value, "Insufficent Funds");
            _balance[msg.sender] -= _value;
            _balance[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return success;
        }

        function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success){
            uint256 approvedAmount = _allowance[_from][_to];
            require(approvedAmount <= _value, "Insufficent allowance");
            _balance[_from] -= _value;
            _balance[_to] += _value;
            emit Transfer(_from, _to, _value);
            return success;
        }

        function approve(address _spender, uint256 _value) external override returns (bool success){
            require(_balance[msg.sender] >= _value, "Insufficent Funds");
            _allowance[msg.sender][_spender] = _value;
            emit Approval(msg.sender, _spender, _value);
            return success;

        }
        function allowance(address _owner, address _spender) external override view returns (uint256 remaining){
            return _allowance[_owner][_spender];
        }


    }
