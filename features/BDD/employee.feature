#language: pt

Funcionalidade: Pesuisar funcionarios
    Para averiguar informaçoes 
    O usuario do sistema
    Deseja poder consultar informaçoes dos funcionarios


   Cenario: Buscar informações de funcionario
       Dado que o usuario consulte informações de fucncionario
       Quando ele realizar a pesquisa
       Então uma lista de funcionarios deve retornar
        
    Cenario: Cadastrar funcionario 
        Dado que o usuario cadastre um novo funcionario 
        Quando ele enviar as informaçoes do funcionario 
        Então esse funcionario sera cadastrado

    @cenario
    Cenario: Alterar informações cadastrais
    Dado que o usuario altere uma informação de fucncionario
    Quando ele enviar as novas informações 
    Então as informações serão alteradas 


 