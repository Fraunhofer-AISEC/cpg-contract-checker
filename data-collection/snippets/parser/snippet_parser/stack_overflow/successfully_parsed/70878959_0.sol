contract Coursetro {
    uint counter = 0;
    event SetCounter(uint value);

    function setCounter(uint value) public {
       counter +=1;
       emit SetCounter(value);
   }

   function getCounter() public view returns (uint) {
       return counter;
   }
    
}
