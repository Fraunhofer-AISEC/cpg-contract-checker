interface X {
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value)external payable returns (bool success);
}

contract A {
    X public token;
    
    constructor(address payable _address){
        token = X(_address);

    }
    
    function GetbalanceOf(address _owner) external view returns (uint balance) {
        return token.balanceOf(_owner);
    }
    function buy(address xx) external  {
         token.transfer(xx,100);
    }
}
