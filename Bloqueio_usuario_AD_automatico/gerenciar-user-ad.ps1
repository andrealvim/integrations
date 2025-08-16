#importa o arquivo dos usuario que devem ser bloqueados
#
Import-Csv "C:\script\lista.csv"|
Foreach {
#buca a data atual
$Datual = Get-Date -UFormat "%d/%m/%Y"
$inicio = $_.inicio
$fim = $_.fim
$name = $_.SamAccountName
$dfile = Get-Date -UFormat "%d-%m-%Y"
$log="C:\script\log\bloqueiados-desbloqueiov1-$($dfile).txt"
#valida data igual ou menor que atual e bloqueia
Invoke-Expression "echo ----------------------------------------------------------------" >> $log
Invoke-Expression "echo 'Executado dia $($dfile)'" >> $log
Invoke-Expression "echo ----------------------------------------------------------------" >> $log
Invoke-Expression "echo ================================================================" >> $log
if (((Get-Date $inicio) -ile (Get-Date $Datual)) -and ((Get-Date $Datual) -ile (Get-Date $fim))){
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
#faz o desbloqeuio se a data for igual a atual
}| 
Invoke-Expression "echo =============================//=================================" >> $log
