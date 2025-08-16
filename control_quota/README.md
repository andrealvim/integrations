# Windows FileServer Quota Control
Powershell, Zabbix, and Grafana were used to perform quota control.

Powershell takes information about each folder, quota, and used space and converts it into a .json file that is sent by the Zabbix agent. The template automatically includes each folder.

## How To
- Copy the **quotasv1.ps1** script in the Zabbix agent folder (in this example, it's **C:\ZabbixAgent** ).
- Import **quota_monitoring.xml** into the FileServer task scheduler.
- Adjust the Zabbix agent file in the section below to the path where the JSON is being saved, if it's different from the one indicated in this article.
```
UserParameter=check.quota,type C:\ZabbixAgent\quota.json
```

> [!NOTE]
> In the **quotasv1.ps1** script, adjust the application root directory.
```
$path1 = Get-FsrmQuota -Path "C:\administration\..." | Select Path,Size,Usage 
$path2 = Get-FsrmQuota -Path "C:\session\..." | Select Path,Size,Usage 
```
* The Zabbix template is the **zbx_templates_Windows_File_Server.xml** file.

* The Grafana template is the **Quotas_file_Server.json** file.

![print-quota.png](https://github.com/andrealvim/integrations/blob/main/control_quota/print-quota.png?raw=true)