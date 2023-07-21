const originalMessage = "I agree to the terms and conditions of this site.";
const timestamp = Math.floor(Date.now() / 1000) + 3600; 
const messageWithTimestamp = `${originalMessage}\n Timestamp: ${timestamp}`;
const signer = provider.getSigner();
const signature = await signer.signMessage(messageWithTimestamp);
