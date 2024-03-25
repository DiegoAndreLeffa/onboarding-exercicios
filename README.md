# onboarding-exercicios

# Arquitetura e Conceitos 
## Exercícios Teóricos
 
- Explique o conceito de Modelos no desenvolvimento de aplicativos. Por que são importantes?
 
Utilize o exemplo da entidade Users para ilustrar sua resposta.
 
Os *modelos* são essenciais para definir como os dados são organizados em um aplicativo. Eles garantem que as informações estejam organizadas e consistentes.
 
O modelo de usuários é uma representação dos dados necessários para armazenar informações sobre os usuários em um sistema. Ele inclui os seguintes campos:
 
- **id:** Identificador único do usuário (UUID).
- **email:** Endereço de e-mail do usuário (String de até 100 caracteres).
- **userName:** Nome de usuário do usuário (String de até 100 caracteres).
- **password:** Senha do usuário (String de até 100 caracteres).
- **firstName:** Primeiro nome do usuário (String de até 50 caracteres).
- **lastName:** Sobrenome do usuário (String de até 50 caracteres).
 
Este modelo é utilizado para garantir a consistência e a estrutura dos dados relacionados aos usuários dentro do sistema.
 
- Descreva o papel dos Serviços em um aplicativo e como eles interagem com os Modelos.
 
Referencie o serviço UserManagement para explicar como os serviços expõem operações CRUD.
 
Os serviços desempenham um papel fundamental na implementação de funcionalidades específicas e na comunicação entre diferentes partes do sistema.
 
```
service UserManagement {
     entity User as projection on db.Users
}
```
 
No contexto do exemplo do serviço UserManagement, ele age como uma interface para manipular os dados relacionados aos usuários do sistema.
 
- O que é a CDS Query Language (CQL) e como ela se diferencia do SQL tradicional?
 
Apresente vantagens do uso do CQL em projetos que utilizam CAP.
 
É uma linguagem de consulta de dados introduzida pela SAP no contexto de seu CDS (Core Data Services).
 
Utilizar CQL em projetos oferece uma série de vantagens notáveis. Sua compatibilidade com diversos bancos de dados suportados pelo CAP simplifica a gestão dos sistemas. Além disso, o CQL promove a manutenção de um código mais limpo e compreensível, tornando o processo de desenvolvimento mais facil. Com uma sintaxe simplificada, ele aumenta a produtividade.

# Modelagem de dados
## Exercícios Teóricos

1 - Qual palavra-chave é usada para declarar uma entidade no CDS?

*entity*
 
2 - O que o termo 'managed' indica quando usado na definição de uma entidade?
 
*Que os campos createdAt, createdBy, modifiedAt e modifiedBy são gerenciados automaticamente.*
 
3 - Que a entidade não pode ter propriedades adicionadas.
Qual tipo de relacionamento indica que objetos relacionados não podem existir sem o objeto principal?
 
*Composição* 

