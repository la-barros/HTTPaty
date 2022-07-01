#language: pt

Funcionalidade: Pesuisar funcionarios
    Para averiguar informaçoes 
    O usuario do sistema
    Deseja poder consultar informaçoes dos funcionarios


   Cenario: Buscar informações de funcionario
       Dado que o usuario consulte informações de fucncionario
       Quando ele realizar a pesquisa
       Então uma lista de funcionarios deve retornar
    @cenario    
    Cenario: Cadastrar funcionario 
        Dado que o usuario cadastre um novo funcionario 
        Quando ele enviar as informaçoes do funcionario 
        Então esse funcionario sera cadastrado


 