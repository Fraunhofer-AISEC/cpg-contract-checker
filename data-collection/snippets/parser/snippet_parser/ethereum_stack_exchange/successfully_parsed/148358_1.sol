abstract contract DyDxPool is Structs {
    function getAccountWei(Info memory account, uint256 marketId)
        virtual
        public
        view
        returns (Wei memory);

    function operate(Info[] memory, ActionArgs[] memory) virtual public;
}
