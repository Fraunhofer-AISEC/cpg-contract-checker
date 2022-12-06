contract Foo
{
    function Foo() {}
}

bytecode: 60606040525b600056

contract FooFactory
{
    function newFoo() returns (Foo) {
       return new Foo();
    }
}

bytecode: 6060604052346000575b6092806100166000396000f3606060405260e060020a60003504639a67a7068114601c575b6000565b346000576026604f565b6040805173ffffffffffffffffffffffffffffffffffffffff9092168252519081900360200190f35b6000604051602080607283396040519101819003906000f0801560005790505b90566060604052346000575b5b5b60098060176000396000f360606040525b600056                                                                        
                                                                                                                                                                                                                                                                                                                                        ^ Foo bytecode starts here
