private static final int SLEEP_DURATION = 15000;
private static final int ATTEMPTS = 40;

private TransactionReceipt getTransactionReceipt(
        String transactionHash, int sleepDuration, int attempts)
        throws IOException, InterruptedException, TransactionTimeoutException {

    Optional<TransactionReceipt> receiptOptional =
            sendTransactionReceiptRequest(transactionHash);
    for (int i = 0; i < attempts; i++) {
        if (!receiptOptional.isPresent()) {
            Thread.sleep(sleepDuration);
            receiptOptional = sendTransactionReceiptRequest(transactionHash);
        } else {
            return receiptOptional.get();
        }
    }

    throw new TransactionTimeoutException("Transaction receipt was not generated after " +
            ((sleepDuration * attempts) / 1000 +
                    " seconds for transaction: " + transactionHash));
}
