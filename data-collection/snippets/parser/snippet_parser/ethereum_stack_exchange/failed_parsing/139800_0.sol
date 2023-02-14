import { useContract } from '@thirdweb-dev/react'

export default function Component() {
  const { contract, isLoading, error } = useContract("0xa478F76110110fB4cd5CCAA33d0Ac62C3364A021", "nft-collection-name")

  
}
