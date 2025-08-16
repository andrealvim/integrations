Scripts para bloquear usuario do Active Directory com powershell
- Crie a pasta c:\script
- Coloque os arquivos gerenciar-user-ad.ps1 e lista.csv nesta pasta
O arquivo lista.csv é pré-definida com SamAccountName, Nome, data de início e fim do bloqueio
-o arquivo gerencia_de_usuario.xml deve ser importado no agendador de tarefa do Windows, ajuste o usuário que vai executar no agendado com privilegio suficiente para desativar e ativar usuários no Active Directory (AD)
Após a execução do script o usuário desativado terá incluído no campo pagina de web o período de bloqueio do usuário.

![ad-01.png](https://github.com/andrealvim/automations/blob/main/PowerShell/Bloqueio_usuario_AD_automatico/ad-01.png?raw=true)