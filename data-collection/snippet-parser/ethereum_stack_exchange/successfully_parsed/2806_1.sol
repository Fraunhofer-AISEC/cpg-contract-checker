contract ContractAddress {

    address public disAddress;

    constructor() public {
        assembly {
            sstore(disAddress_slot, address)
        }
    }
}
