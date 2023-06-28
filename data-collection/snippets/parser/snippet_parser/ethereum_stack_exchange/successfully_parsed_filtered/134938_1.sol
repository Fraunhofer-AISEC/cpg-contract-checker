    function initialize(address _creator)
        public
        override
        initializer
        VRFConsumerBaseV2(vrfCoordinatorV2)
    {
        
        i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
    }
