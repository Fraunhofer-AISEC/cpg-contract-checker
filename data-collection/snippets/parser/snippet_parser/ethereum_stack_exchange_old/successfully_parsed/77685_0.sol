pragma solidity >=0.4.2 <0.6.0;

    contract LairToken {
    
    string public name = "Lair Token";
    
    string public symbol = "LAIR";
    string public standard = "Lair Token v1.0";
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;

        totalSupply = _initialSupply;
        
    }

        

      function transfer(address _to, uint256 _value) public returns (bool sucess) {
        

        require(balanceOf[msg.sender] >= _value);
        
        
        


      }

}
