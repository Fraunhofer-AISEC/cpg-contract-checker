function getOrder(
        bool _orderType,
        bytes32 _id
    )
        public
        view
        returns (
            address maker,
            uint have,
            uint want,
            bytes32 prevID,
            bytes32 nextID
        )
