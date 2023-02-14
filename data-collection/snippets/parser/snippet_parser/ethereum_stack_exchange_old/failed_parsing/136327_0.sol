function F()public returns(uint){
     uint gasLeftBefore = gasleft()

     ... contract logic

     uint gasLeftAfter = gasleft()
     return gasLeftAfter - before
}
