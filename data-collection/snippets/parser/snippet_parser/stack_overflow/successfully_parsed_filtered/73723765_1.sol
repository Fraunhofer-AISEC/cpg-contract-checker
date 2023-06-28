contract Test {
    Demo demo = new Demo();

    function testGas() public {
        uint256 startGas = gasleft();
        demo.add1(1, 2);
        uint256 endGas = gasleft();
        uint256 gasUsage1 = startGas - endGas;

        startGas = gasleft();
        demo.add1(1, 2);
        endGas = gasleft();
        uint256 gasUsage2 = startGas - endGas;
    }
}
