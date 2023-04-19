function getDelta(address calculatorAddress) external returns (int256 delta) {
        ICalculator calculator = ICalculator(calculatorAddress);

        int256 preUpdateValue = calculator.getValue();

        calculator.update();

        int256 postUpdateValue = calculator.getValue();

        delta = postUpdateValue - preUpdateValue;
    }
}
