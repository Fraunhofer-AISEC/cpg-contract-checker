FeatureData storage featureData = data[key];
featureData.state = State.Deployment;
featureData.backers.length = 0;
featureData.raised = 0;
featureData.prepaid = 0;
