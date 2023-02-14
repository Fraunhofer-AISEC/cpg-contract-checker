var event = myContractInstance.SquareComputed({});


event.watch(function(error, result){
  if (!error)
    resolve({
        primary_address: config.ethConfig.primary_address,
        numSquare : result  
    })
  event.stopWatching();
});
