function createTicket(bytes calldata params) external ... {
    (uint32[] arrDate, uint8[] arrCategory) = abi.decode(params, (uint32[], uint8[]));
