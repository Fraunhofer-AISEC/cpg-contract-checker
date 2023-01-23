type = "directrequest"
schemaVersion = 1
name = "Pliant-Chian_Adapter_5"
contractAddress = "0xec5368C5C258412B8518AEeb6966FAE07d0fc545"
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type=ethabidecodelog
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type=cborparse data="$(decode_log.data)"]
    fetch        [type=bridge name="test_pliant-chain_adaptor" requestData="{\\"id\\":$(jobSpec.externalJobID),\\"data\\":{\\"orgAddress\\": $(decode_cbor.orgAddress),\\"senderAddress\\":$(decode_cbor.senderAddress),\\"receiverAddress\\": $(decode_cbor.receiverAddress),\\"jwtToken\\": $(decode_cbor.jwtToken)}}"]
    
    decode_log -> decode_cbor -> fetch

    fetch -> parse_allInSystem
    fetch -> parse_isProject
    fetch -> parse_senderAuthority
    fetch -> parse_receiverAuthority
    
    parse_allInSystem               [type=jsonparse path="data,allInSystem" data="$(fetch)"]
    parse_isProject                 [type=jsonparse path="data,isProject" data="$(fetch)"]
    parse_senderAuthority           [type=jsonparse path="data,senderAuthority" data="$(fetch)"]
    parse_receiverAuthority         [type=jsonparse path="data,receiverAuthority" data="$(fetch)"]

    parse_allInSystem -> encode_mwr
    parse_isProject -> encode_mwr
    parse_senderAuthority -> encode_mwr
    parse_receiverAuthority -> encode_mwr

    encode_mwr   [type=ethabiencode abi="(bytes32 requestId, uint256 allInSystem, uint256 isProject, uint256 senderAuthority, uint256 receiverAuthority)" data="{ \\"requestId\\": $(decode_log.requestId), \\"allInSystem\\": $(parse_allInSystem), \\"isProject\\": $(parse_isProject), \\"senderAuthority\\": $(parse_senderAuthority), \\"receiverAuthority\\": $(parse_receiverAuthority)}"]
    encode_tx    [type=ethabiencode
                  abi="fulfillOracleRequest(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes calldata data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_mwr)}"
                 ]
    submit_tx    [type=ethtx to="0xec5368C5C258412B8518AEeb6966FAE07d0fc545" data="$(encode_tx)"]

    encode_mwr -> encode_tx -> submit_tx
"""
