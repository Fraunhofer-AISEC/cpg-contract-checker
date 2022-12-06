import { ethers } from 'hardhat'
import type { BigNumber } from 'ethers'

export function bigNumberToString(bn: BigNumber): string {
  return ethers.BigNumber.from(bn).toString()
}
