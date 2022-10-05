  <div className="section">
    <h2>Testing Poni</h2>
    <p>
      This is a initial test to create Poni
    </p>
    <p>
      <strong>Stored Value: </strong>
      <ContractData
        drizzle={drizzle}
        drizzleState={drizzleState}
        contract="PoniOwnership"
        method="getMyPonies"
      />
    </p>
    <ContractForm drizzle={drizzle} contract="PoniOwnership" method="createPoni" />
  </div>
