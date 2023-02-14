resolve(
  amountIn: PromiseOrValue<BigNumberish>,
  resolverOptions: PromiseOrValue<BytesLike>,
  overrides?: Overrides & { from?: PromiseOrValue<string> }
): Promise<ContractTransaction>;

export type SwapResolverOptionsStruct = {
  path: PromiseOrValue<BytesLike>;
  deadline: PromiseOrValue<BigNumberish>;
  amountIn: PromiseOrValue<BigNumberish>;
  amountOutMinimum: PromiseOrValue<BigNumberish>;
  inputTokenAddress: PromiseOrValue<string>;
  targetAddress: PromiseOrValue<string>;
  destinationAddress: PromiseOrValue<string>;
};
