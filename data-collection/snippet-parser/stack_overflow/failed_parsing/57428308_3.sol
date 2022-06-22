{ InvalidAsn1Error: encoding too long
    at newInvalidAsn1Error (/Users/milandavidovic/node_modules/asn1/lib/ber/errors.js:7:13)
    at Reader.readLength (/Users/milandavidovic/node_modules/asn1/lib/ber/reader.js:103:13)
    at Reader.readSequence (/Users/milandavidovic/node_modules/asn1/lib/ber/reader.js:136:16)
    at Object.publicImport (/Users/milandavidovic/node_modules/node-rsa/src/formats/pkcs1.js:122:14)
    at Object.detectAndImport (/Users/milandavidovic/node_modules/node-rsa/src/formats/formats.js:65:48)
    at NodeRSA.module.exports.NodeRSA.importKey (/Users/milandavidovic/node_modules/node-rsa/src/NodeRSA.js:183:22)
    at new NodeRSA (/Users/milandavidovic/node_modules/node-rsa/src/NodeRSA.js:73:18)
    at getPublicKeyFromSignature (/Users/milandavidovic/masterthesis/Scripts/DeployContract.js:280:15)
    at <anonymous> name: 'InvalidAsn1Error', message: 'encoding too long' }
(node:1101) UnhandledPromiseRejectionWarning: InvalidAsn1Error: encoding too long
    at newInvalidAsn1Error (/Users/milandavidovic/node_modules/asn1/lib/ber/errors.js:7:13)
    at Reader.readLength (/Users/milandavidovic/node_modules/asn1/lib/ber/reader.js:103:13)
    at Reader.readSequence (/Users/milandavidovic/node_modules/asn1/lib/ber/reader.js:136:16)
    at Object.publicImport (/Users/milandavidovic/node_modules/node-rsa/src/formats/pkcs1.js:122:14)
    at Object.detectAndImport (/Users/milandavidovic/node_modules/node-rsa/src/formats/formats.js:65:48)
    at NodeRSA.module.exports.NodeRSA.importKey (/Users/milandavidovic/node_modules/node-rsa/src/NodeRSA.js:183:22)
    at new NodeRSA (/Users/milandavidovic/node_modules/node-rsa/src/NodeRSA.js:73:18)
    at getPublicKeyFromSignature (/Users/milandavidovic/masterthesis/Scripts/DeployContract.js:280:15)
    at <anonymous>
(node:1101) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). (rejection id: 1)
(node:1101) [DEP0018] DeprecationWarning: Unhandled promise rejections are deprecated. In the future, promise rejections that are not handled will terminate the Node.js process with a non-zero exit code.
