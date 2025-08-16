# Created by André Alvim
# GitHub.com - account - @andrealvim
# mail = at.tolentino.30@gmail.com
$path = "C:\ZabbixAgent\quota.json"
$cota = '{ "quota": ['
#change the -Path to your quota managed folder
$path1 = Get-FsrmQuota -Path "C:\administration\..." | Select Path,Size,Usage 
$path2 = Get-FsrmQuota -Path "C:\session\..." | Select Path,Size,Usage 
Write-Output $($path1) $($path2) | ConvertTo-Json |Out-String | Out-File $path
(get-content -Path $path) -replace '\[',$cota | set-content -path $path
(get-content -Path $path) -replace '\]',']}' | set-content -path $path