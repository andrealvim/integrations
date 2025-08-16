# Automatically blocking users in Active Directory (AD)

If you need to block and unblock users within a specific period, this can be very costly when the user volume is high.
To solve this problem, I created a PowerShell script that performs this function using a CSV user list.
To simplify the script, the blocking period information is placed in the web page field.


![ad-01.png](https://github.com/andrealvim/integrations/blob/main/Bloqueio_usuario_AD_automatico/ad-01.png?raw=true)


 However, if you want to use another field, simply adjust the "manage-user-ad.ps1" script on lines 25 and 34 (replace **-HomePage**  with the desired field ).
```
#executa o bloqueio de rede
#execute network lock
Set-ADUser -Identity $name -HomePage "Bloqueado de $inicio ate $fim'" >> $log
Disable-ADAccount -Identity $name
Invoke-Expression "echo '$($name) - Bloqueado de rede - inicio $($inicio)'" >> $log
}
#desbloqueio usuário
#unlock user
else{
#executa o desbloqueio de rede
#execute network unlock
Set-ADUser -Identity $name -HomePage " "
Enable-ADAccount -Identity $name
Invoke-Expression "echo '$($name) - Desbloqueado de rede - fim $($fim)'" >> $log
}
```
## How To
- Create the **c:\script** folder
- Place the **gerenciar-user-ad.ps1** and **lista.csv** files in this folder.
The list.csv file is predefined with the SamAccountName, First Name, and the start and end date of the block.
- The **gerencia_de_usuario.xml** file must be imported into the Windows Task Scheduler. Set the user who will run it to the scheduled task with sufficient privileges to deactivate and activate users in Active Directory (AD).