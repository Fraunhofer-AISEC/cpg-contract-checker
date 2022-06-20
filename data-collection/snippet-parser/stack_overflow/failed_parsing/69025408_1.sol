TransactionReceipt transactionReceiptData = sampleContract.getSellerAddress().send();

EthFilter filter = new EthFilter(DefaultBlockParameterName.LATEST, DefaultBlockParameterName.LATEST, sampleContract.getContractAddress());

String encodedEventSignature = EventEncoder.encode(sampleContract.EVENT_NAME);

filter.addSingleTopic(encodedEventSignature);
                
System.out.println("subscribing to event with filter");
                
Web3j.ethLogFlowable(filter).subscribe(eventString -> eventString.toString());
                
