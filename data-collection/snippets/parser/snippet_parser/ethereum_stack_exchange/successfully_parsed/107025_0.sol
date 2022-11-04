abstract contract Base1 {
    function foo() internal view virtual returns (address) {
        return msg.sender;
    }
}

abstract contract Base2 {
    function foo() internal override virtual view returns (address payable ret) {
         return msg.sender;
    } 
}
