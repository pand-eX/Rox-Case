## Case Rox !!! Projeto !!! 

Pelo fato de não ter certo e errado no case eu irei ser criativo e tentar mesclar nuvens e ferramentas. Irei desenvolver um Data Warehouse, podendo ser feito até um data marts que seriam pequenos DW segmentado para cada área da empresa, exemplo: RH, Finanças, Marketing e etc... Vou utilizar duas nuvens AWS e GCP.



![1]



Perdão pelo desenho !!! haha !!!
Em uma implementação de DW em Nuvem, a arquitetura envolve fatores além do serviço em nuvem (AWS e GCP), pois precisamos definir níveis de acesso e segurança, armazenamento, backup, integração, ETL, custos de transferência de dados e etc... Tudo isso deve ser levado em consideração. Embora exista outras opções. Além do Amazon Redshift uma implementação de DW requer o uso de outros serviços AWS, tais como:


- S3 (Simple Storage Service)


- VPC (Virtual Private Cloud)


- EIP (ELASTIC IP)

- Cloud Watch

- IAM (Identity and Access Management)


S3 para colocar os arquivos que serão carregados no DW, EIP para ter um IP exclusivo e Cloud Watch para monitoramento e alarmes não são obrigatórios e em uma implementação do Redshift, mas podem ajudar a colaboram para tornar a experiência em nuvem bem mais profissional.
A arquitetura do DW na AWS pode ser dividida em duas etapas. Primeiro a arquitetura do Cluster Amazon Redshift.


![2]

Em Segundo, a arquitetura de acesso ao cluster Redshift, para que os usuários tenham acesso ao DW.




![3]



Nesta etapa outros serviços AWS devem ser considerados. O VPN Gateway permite criar uma conexão segura entre o escritório da empresa e o ambiente AWS. Umas arquiteturas mais avançadas podem requerer o uso de serviços de mensageria, como o AWS SQS, que garante o funcionamento da aplicação mesmo em caso de queda do DW.

Em questão de Escalabilidade e versionamento o Redshift é muito bacana irei deixar uma imagem onde você pode ter uma noção o quanto ele pode ser poderoso, conectando ferramentas de BI, conexão com Data Lake (depois de estruturar os dados) e outros serviços.



![4]




## Vamos lá !!! Colocando a mão na massa !!
Primeira Etapa é a criação do Cluster Redshift. Ela é simples lembrando que precisa ser criado o cluster. Como irei excluir o cluster após o termino do projeto não tem problema eu mostrar as chaves. Lembrando que o Endpoint é a sua string de conexão ao um serviço AWS e não deve ser divulgado. 




![5]




Irei usar uma Ferramenta para conexão ao cluster Amazon Redshift, embora pode ser feito com o terminal via conexão SSH. A amazona fornece uma string de conexão, mas para funcionar a string eu preciso baixar o Driver JDBC ou ODBC.
Na página da amazona diz que o amazon redshift foi feito para trabalhar com qualquer ferramenta de BI se você não tem pode usar uma ferramenta grátis ou utilizar o SQL Workbench/J “Não confundir com MySQL Workbench” estou usando a versão 123.
Link: https://www.sql-workbench.eu/download-archive.html

## Configurando


![6]



O processo é bem simples você só precisa encontrar a Pasta onde você baixou a string de conexão JDBC Driver e colocar o diretório na configuração do URL.
Quando você tentar conecta recebera um Timed out porque precisa de mais uma etapa que é configurar a Virtual Private Cloud (VPC), uma já vem padrão é precisamos configurar uma com o Redshift. 



![7]


E Por fim é entrar no Cluster criar as tabelas e seus relacionamento e criar também e conectar a ferramenta de BI como power-bi se for desejo da infraestrutura. 
Obs: Script estão em anexo !!!



![8]


Agora vem a parte que é o desafio da Rox a ingestão dos dados para o DW.  Uma das coisas que a Amazon recomenda e que os dados ou seja, os arquivos estejam em um repositório internamente dentro da prória AWS e irei utilizar para isso o Amazon S3.


![9]


Agora é basicamente copiar do S3 para nossas tabelas no Amazon Redshift.

Para usar o comando copy para enviar os dados do s3 para o redshift vai precisar do IAM role. O fato de você ter 2 serviços AWS não significa que eles vão se comunicar automaticamente, precisamos dar uma força para eles se comunicar.
Então precisamos Cria o IAM Role


![10]


E usaremos o comando copy para fazer esse envio de dados ficando basicamente:

copy rw_customer (Nome da tabela do destino lá do Redshift)
from 's3://awsdwrox/Sales.Customer.csv' (Aqui é o nome do Bucket s3 que você criou com o nome do arquivo)
iam_role 'arn:aws:iam::069732112377:role/awsdwredshifts3' (IAM Role que foi criado)
region 'us-east-2'(região que você está usando os serviços)
delimiter ',' (delimitador do arquivo)

E Pronto carregado no destino os dados, agora é só fazer as consultar e conectar a ferramenta de BI para visualização.
Agora vem a parte que eu usei a criatividade e adicionei outra nuvem a GCP, haha !!! Am vez de utilizar o Amazon Redshift como DW irei migrar para o BigQuery na plataforma de nuvem GCP(Google Cloud Plataform).
Se eu fosse utilizar esse mesmo exemplo que fiz com AWS no GCP basicamente muda alguns aspectos de cloud para cloud, mas a lógica é praticamente a mesma, a GCP também fala que uma boa prática e ter os dados armazenados internamente na nuvem e para isso podemos utilizar Cloud Storage como bucket e depois fazer a ingestão para o BigQuery. Portanto ao invez de fazer essa etapa de adicionar os dados em um Backup da GCP na hora da ingestão dos dados na Bigquery tem uma opção de S3 Amazon então foi basicamente o que eu fiz, usei o S3 da amazon como bucket e joguei os dados para um dw na GCP o BigQuery.


![11]

Como etapa final a criação do Dashboard utilizando o Power-bi, lembrando que pode ser usado Tableau e outros.

![12]
