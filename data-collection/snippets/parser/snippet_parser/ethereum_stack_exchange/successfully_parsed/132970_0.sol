function run() external {
        vm.startBroadcast();

        MyContract(
            HuffDeployer
                .config()
                .deploy("MyContract")
        );

        vm.stopBroadcast();
    }
