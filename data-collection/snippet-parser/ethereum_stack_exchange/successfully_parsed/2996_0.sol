function inferior(uint unit, string denomination) public returns(bool){
         if (msg.value < unit & denomination) {
             return true;
         }
inferior(100, "finney");
}