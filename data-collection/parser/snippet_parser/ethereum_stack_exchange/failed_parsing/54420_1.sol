it('ecrecover result matches address', async function () {
    var address = owner;
    const message = 'Lorem ipsum mark mark dolor sit amet, consectetur adipiscing elit. Tubulum fuisse, qua illum, cuius is condemnatus est rogatione, P. Eaedem res maneant alio modo.';

    var sig = await generateSignature(address, message);
    var ret = await verifySignature(address, message, sig);

    var result = await coinx.registerAddress.sendTransaction(address, ret.encoded, ret.v, ret.r, ret.s, {from: address});
    assert.equal(result, true);
  });
