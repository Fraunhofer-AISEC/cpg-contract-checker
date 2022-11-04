contract Foo {

    
    function do() external virtual public {
         
    }
}

contract Bar is Foo {
    function do() external public override(Foo) {
        super.do() 

        this.do() 

        this.super.do() 
    }
}
