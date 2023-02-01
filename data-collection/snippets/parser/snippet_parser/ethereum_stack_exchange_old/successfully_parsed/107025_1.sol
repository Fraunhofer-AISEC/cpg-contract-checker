contract MyContract is Base1, Base2 {
    
    function foo() internal view override(Base1, Base2) returns (address payable) {
         return msg.sender;
    }
}
