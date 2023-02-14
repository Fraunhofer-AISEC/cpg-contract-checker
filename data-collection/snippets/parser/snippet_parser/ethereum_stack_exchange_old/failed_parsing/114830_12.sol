const { error: contractError, reason } = error.data[Object.keys(error.data)[0]];

assert.strictEqual(contractError, expectedError, `Thrown error code: ${contractError} was not the expected: ${expectedError}.`);

assert.strictEqual(reason, message, 'Thrown error message was not the expected.');
