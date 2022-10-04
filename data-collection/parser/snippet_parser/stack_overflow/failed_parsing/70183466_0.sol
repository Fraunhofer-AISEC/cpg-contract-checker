type Token @entity {
  id: ID!
  contract: GameERC721Contract!
  owner: Owner!
  tokenID: BigInt!
  tokenURI: String!
  mintTime: BigInt!
  attrID:[BigInt!]!
  attrValue:[BigInt!]!
}
