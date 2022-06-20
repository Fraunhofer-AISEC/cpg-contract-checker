app.post('/create/fixedprice', async (req, res, next) => {
  const { error } = validateFPSO(req.body);
  if (error) {
    let errMsg = error.details[0].message;
    winston.error(`Failed to validate create fixed-price-order - ${errMsg}`);
    res.status(400).send(errMsg);
    return;
  }

  try {
    const fixedPriceSellOrder = await seaport.createSellOrder({
      asset: {
        tokenId: req.body.tokenId,
        tokenAddress: req.body.contractAddress,
      },
      startAmount: req.body.startAmount,
      expirationTime: req.body.expirationTime,
      accountAddress: req.body.ownerAddress,
    });
    winston.info(`Successfully created a fixed-price sell order! ${fixedPriceSellOrder.hash}\n`);
    winston.debug(`Returning hash = ${fixedPriceSellOrder.hash} and opensea-link = ${fixedPriceSellOrder.asset.openseaLink}`);
    res.json({
      orderHash: fixedPriceSellOrder.hash,
      listing_url: fixedPriceSellOrder.asset.openseaLink
    });
  } catch (error) {
    winston.debug(`Error caught - ${error}`);
    return next(error);
  }
});
