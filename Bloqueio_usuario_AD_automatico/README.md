#Automatically blocking users in Active Directory (AD)

If you need to block and unblock users within a specific period, this can be very costly when the user volume is high.
To solve this problem, I created a PowerShell script that performs this function using a CSV user list.
To simplify the script, the blocking period information is placed in the web page field. However, if you want to use another field, simply adjust the "manage-user-ad.ps1" script on lines 19 and 26 (replace -HomePage with the desired field).
```
#executa o bloqueio de rede
Set-ADUser -Identity $name -HomePage "Bloqueado de $inicio ate $fim'" >> $log
Disable-ADAccount -Identity $name
Invoke-Expression "echo '$($name) - Bloqueado de rede - inicio $($inicio)'" >> $log
}
#desbloqueio
else{
#executa o desbloqueio de rede
Set-ADUser -Identity $name -HomePage " "
Enable-ADAccount -Identity $name
Invoke-Expression "echo '$($name) - Desbloqueado de rede - fim $($fim)'" >> $log
}
```

![ad-01.png](https://github.com/andrealvim/integrations/tree/main/Bloqueio_usuario_AD_automatico/ad-01.png?raw=true)


- Crie a pasta c:\script
- Coloque os arquivos gerenciar-user-ad.ps1 e lista.csv nesta pasta
O arquivo lista.csv é pré-definida com SamAccountName, Nome, data de início e fim do bloqueio
-o arquivo gerencia_de_usuario.xml deve ser importado no agendador de tarefa do Windows, ajuste o usuário que vai executar no agendado com privilegio suficiente para desativar e ativar usuários no Active Directory (AD)
Após a execução do script o usuário desativado terá incluído no campo pagina de web o período de bloqueio do usuário.

