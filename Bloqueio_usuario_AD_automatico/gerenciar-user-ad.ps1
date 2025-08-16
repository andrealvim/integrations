#Create by Andrealvim
#github.com/andrealvim
#Script para bloquear e desbloquear usuarios no AD de acordo com a data informada
#importa o arquivo dos usuario que devem ser bloqueados
#import the file of users that should be blocked
Import-Csv "C:\script\lista.csv"|
Foreach {
#busca a data atual
#search the current date
$Datual = Get-Date -UFormat "%d/%m/%Y"
$inicio = $_.inicio
$fim = $_.fim
$name = $_.SamAccountName
$dfile = Get-Date -UFormat "%d-%m-%Y"
$log="C:\script\log\bloqueiados-desbloqueiov1-$($dfile).txt"
#valida data igual ou menor que atual e bloqueia
#valida date equal to or less than current and block
Invoke-Expression "echo ----------------------------------------------------------------" >> $log
Invoke-Expression "echo 'Executado dia $($dfile)'" >> $log
Invoke-Expression "echo ----------------------------------------------------------------" >> $log
Invoke-Expression "echo ================================================================" >> $log
if (((Get-Date $inicio) -ile (Get-Date $Datual)) -and ((Get-Date $Datual) -ile (Get-Date $fim))){
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
#faz o desbloqeuio se a data for igual a atual
#unlock if the date is the same as the current date
}| 
Invoke-Expression "echo =============================//=================================" >> $log
