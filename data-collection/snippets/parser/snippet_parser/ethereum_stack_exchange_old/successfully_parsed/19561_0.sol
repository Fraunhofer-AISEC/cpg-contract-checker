pragma solidity ^0.4.11;

contract Interface {
    function pay();
}

contract Foo {

    function safeTransfer (address _to, uint256 _amount)
    {
        Bar a = new Bar(_to);
        a.transfer(_amount);
        Interface b = Interface(a);
        b.pay();
    }

    function () payable {}
}

contract Bar {

    address payee;

    function Bar (address _payee)
        {
            payee = _payee;
        }

    function () payable {}

    function pay () 
        {
            selfdestruct(payee);
        }
}
