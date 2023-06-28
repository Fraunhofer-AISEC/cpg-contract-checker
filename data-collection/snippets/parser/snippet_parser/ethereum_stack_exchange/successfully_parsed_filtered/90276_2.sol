contract con_A {
    con_H ins_H;
    
    function fun_A1() external view returns (string memory) {
        return ins_H.helloWorld();
    }
}
