function _adjustV(v: number): number {
  const chainId = <chain id of current network - we use public env vars for this>
  const baseV = chainId * 2 + 35
  if (v % 2 === 0) {
    return baseV
  } else {
    return baseV + 1
  }
}
