contract Main  {
  string public name_ = "Test";

  mapping (address=>bool) addressIsApproved; 

  IBEP20 public immutable busd;
  constructor (IBEP20 _busdContract){
    busd = _busdContract;
  }


  function approve (uint256 _amount) public {
     bool isApproved =  IBEP20(busd).approve(msg.sender,_amount);
     addressIsApproved[msg.sender] = isApproved;
  }

  function buy(uint256 _amount) public returns (uint) {
      
      bool isApproved = addressIsApproved[msg.sender];
      if (!isApproved) return 0;

      bool isPay =  IBEP20(busd).transferFrom(msg.sender,address(this), _amount);  
      if (!isPay) return 0;

      
      
      return 1;
  }
}
