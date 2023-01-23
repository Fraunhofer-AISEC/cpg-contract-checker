
pragma solidity >=0.4.22 <0.8.0;

abstract contract TRC20 {
    function decimals() public virtual returns (uint8);
}

contract Matrix {

    function greet() public payable returns (uint8) {
        TRC20 t = TRC20(TKssrn5v8ephdmJbh7UYaUeoR4L1d4ZXds);
        return t.decimals();
    }
}
