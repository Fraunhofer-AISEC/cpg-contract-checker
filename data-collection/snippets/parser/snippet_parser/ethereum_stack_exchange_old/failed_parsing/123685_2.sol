type = "directrequest"
schemaVersion = 1
name = "Get > Uint256"
externalJobID = "2e0441fe-857e-45bc-a8f0-d349bb680afd"
maxTaskDuration = "0s"
contractAddress = "0xD8269ebfE7fCdfCF6FaB16Bb4A782dC8Ab59b53C"
minIncomingConfirmations = 0
observationSource = """
    decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type="cborparse" data="$(decode_log.data)"]
    fetch        [type="http" method=GET url="$(decode_cbor.get)"]
    parse        [type="jsonparse" path="$(decode_cbor.path)" data="$(fetch)"]
    multiply     [type="multiply" input="$(parse)" times=100]
    encode_data  [type="ethabiencode" abi="(uint256 value)" data="{ \\"value\\": $(multiply) }"]
    encode_tx    [type="ethabiencode"
                  abi="fulfillOracleRequest(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes32 data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_data)}"
                 ]
    submit_tx    [type="ethtx" to="0xD8269ebfE7fCdfCF6FaB16Bb4A782dC8Ab59b53C" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch -> parse -> multiply -> encode_data -> encode_tx -> submit_tx
"""
