import './AppStorage.sol';

contract ContractA {
    AppStorage internal s;

    function setNum() public {
        s.num = 20;
    }

    function setNum2() public {
        s.num2 = 15;
    }
}
