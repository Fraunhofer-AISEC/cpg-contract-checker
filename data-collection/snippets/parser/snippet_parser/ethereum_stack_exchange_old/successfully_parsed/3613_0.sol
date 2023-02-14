contract GerenciadorBoletos {

     struct Boleto {
         uint codigoBarra;
         uint codigoBarraDigitavel;
         uint cpfOuCnpjBeneficiario;
         uint cpfOuCnpjPagador;
         uint valorOriginal;
         uint dataVencimento;
     }

     mapping(uint => Boleto) registroBoletos;

     function inserirBoleto(
         uint codigoBarra,
         uint codigoBarraDigitavel,
         uint cpfOuCnpjBeneficiario,
         uint cpfOuCnpjPagador,
         uint valorOriginal,
         uint dataVencimento
     ) {
         Boleto memory b = Boleto(
             codigoBarra,
             codigoBarraDigitavel,
             cpfOuCnpjBeneficiario,
             cpfOuCnpjPagador,
             valorOriginal,
             dataVencimento
         );

         

         registroBoletos[b.codigoBarra] = b;
     }
}
