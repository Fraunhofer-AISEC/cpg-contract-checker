

export interface Overrides {
    gasLimit?: BigNumberish | Promise<BigNumberish>;
    gasPrice?: BigNumberish | Promise<BigNumberish>;
    maxFeePerGas?: BigNumberish | Promise<BigNumberish>;
    maxPriorityFeePerGas?: BigNumberish | Promise<BigNumberish>;
    nonce?: BigNumberish | Promise<BigNumberish>;
    type?: number;
    accessList?: AccessListish;
    customData?: Record<string, any>;
};

export interface PayableOverrides extends Overrides {
    value?: BigNumberish | Promise<BigNumberish>;
}

export interface CallOverrides extends PayableOverrides {
    blockTag?: BlockTag | Promise<BlockTag>;
    from?: string | Promise<string>;
}
