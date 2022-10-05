export default async promise => {
  try {
    await promise;
  } catch (error) {
    
    
    const invalidJump = error.message.search('invalid JUMP') >= 0;
    
    
    
    
    const outOfGas = error.message.search('out of gas') >= 0;
    assert(
      invalidJump || outOfGas,
      "Expected throw, got '" + error + "' instead",
    );
    return;
  }
  assert.fail('Expected throw not received');
};
