dependencies:
  # the pattern is <organization/repo>@<version>
  - smartcontractkit/chainlink-brownie-contracts@0.3.1
  # brownie downloads the above repository

compiler:
  solc:
    remappings:
      - '@chainlink=smartcontractkit/chainlink-brownie-contracts@0.3.1'
      #whenever we see @chainlink in solidity file we mean
      #smartcontractkit/chainlink-brownie-contracts@0.3.1
