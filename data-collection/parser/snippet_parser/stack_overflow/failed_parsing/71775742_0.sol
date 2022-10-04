function myDynamicFunc(uint256 someParam) public {
    bytes4 selector = 

    if (selector == this.myFuncA.selector) {
      myFuncA(someParam);
    } else if (selector == this.myFuncB.selector) {
      myFuncB(someParam);
    }
    

    selector.invoke(someParam);
    
}

