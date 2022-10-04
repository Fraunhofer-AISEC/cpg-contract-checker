contract TheContract_A {
    address public mateAddress = OxB

    function funding(address from) payable public {
        if (from == mateAddress) {
            
        }
    }

    function () checkStatus {
        if (someCondition) {
            TheContract_B instanceOfB = TheContract_B(mateAddres);
            instanceOfB.funding.value(address(this).balance)(address(this));
        }
    }
}

contract TheContract_B {
    address public mateAddress = OxA

    function funding(address from) payable public {
        if (from == mateAddress) {
            
        }
    }

    function () checkStatus {
        if (someCondition) {
            TheContract_A instanceOfA = TheContract_A(mateAddres);
            instanceOfA.funding.value(address(this).balance)(address(this));
        }
    }
}
