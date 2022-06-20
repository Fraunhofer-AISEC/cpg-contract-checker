contract Airdrop {
  address public admin;
...
}
    
constructor(address _token, address _admin) {
        admin = _admin; 
        token = IERC20(_token);
      }
    
     function addinitial(uint amount) external {
        require(msg.sender == admin, 'only admin');
        your function to add liquidities;
      }
