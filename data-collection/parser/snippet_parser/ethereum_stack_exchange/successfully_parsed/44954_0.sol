pragma solidity ^0.4.21;

interface ERC20 {
    function balanceOf(address) external view returns (uint);
    function transfer(address, uint) external returns (bool);
}

contract TestA is ERC20 {
    mapping(address=>uint) public balanceOf;

    function TestA() public {
        balanceOf[this] = 1000;
    }

    function transfer(address _to, uint256 _value) external returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        require(balanceOf[_to] >= _value);
        return true;
    }
}

contract TestB {
    address a;

    function TestB() public {
        a = new TestA();
    }

    function aBalance() external view returns (uint) {
        return ERC20(a).balanceOf(a);
    }
}
