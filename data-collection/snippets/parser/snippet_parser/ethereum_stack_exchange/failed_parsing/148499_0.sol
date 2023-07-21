schemaVersion = 1
name = "Multiple_Array_of_Struct_Datas_1"
forwardingAllowed = true
maxTaskDuration = "0s"
contractAddress = "0x2D470Df5823edefe6941F8F737660661e47f62af"
minContractPaymentLinkJuels = "0"
observationSource = """

decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

decode_log -> decode_cbor


decode_cbor  [type="cborparse" data="$(decode_log.data)"]

fetch [type="http" method=GET url="$(decode_cbor.url)" allowunrestrictednetworkaccess="true"]


decode_cbor -> fetch



path1_parse [type="jsonparse" path="$(decode_cbor.path1)" data="$(fetch)" ]

path2_parse [type="jsonparse" path="$(decode_cbor.path2)" data="$(fetch)"]

path3_parse [type="jsonparse" path="$(decode_cbor.path3)" data="$(fetch)"]

path4_parse [type="jsonparse" path="$(decode_cbor.path4)" data="$(fetch)"]

path5_parse [type="jsonparse" path="$(decode_cbor.path5)" data="$(fetch)"]

fetch -> path1_parse
fetch -> path2_parse
fetch -> path3_parse
fetch -> path4_parse
fetch -> path5_parse

path5_parse -> encode_mwr
path4_parse -> encode_mwr
path3_parse -> encode_mwr
path2_parse -> encode_mwr
path1_parse -> encode_mwr


encode_mwr [type="ethabiencode"
                abi="(bytes32 requestId, Trade[] _prices)"
                data="{\\"requestId\\": $(decode_log.requestId), \\"_prices\\": [[ $(path1_parse)], [$(path2_parse)], [$(path3_parse)], [$(path4_parse)], [$(path5_parse)]]}"
                ]


encode_tx  [type="ethabiencode"
                abi="fulfillOracleRequest2(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes calldata data)"
                data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\":   $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_mwr)}"
                ]
    submit_tx  [type="ethtx" to="0x2D470Df5823edefe6941F8F737660661e47f62af" data="$(encode_tx)" from="[\\"0x761Cd84957ecD0344E6C01a02A7cAe479D07B838\\"]"]
    encode_mwr -> encode_tx -> submit_tx
"""
