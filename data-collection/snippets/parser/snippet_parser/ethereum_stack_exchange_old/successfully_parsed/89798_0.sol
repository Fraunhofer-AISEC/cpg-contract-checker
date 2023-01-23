contract Simple is Ownable {
    
    using SafeMath for uint;
    
    address                      public  fuel;
    uint                         public  initTime;

    
    constructor( address _fuel, uint timer) public {
        
        fuel = _fuel;
        initTime = now.add(timer) ;
    }
}
