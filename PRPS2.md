# PureRESTPowerShell2 Module
## Connect-Pfa2Array
### Synopsis
OAuth2 Authentication
### Syntax
```powershell

Connect-Pfa2Array -ApiClientName <String> [-ApiVersion <String>] -ClientId <String> [-DisableVerboseLogging] -Endpoint <String> [-IgnoreCertificateError] -Issuer <String> -KeyId <String> -PrivateKeyFile <String> [-PrivateKeyPassword <String>] -Username <String> [<CommonParameters>]

Connect-Pfa2Array [-ApiVersion <String>] [-Credential <PSCredential>] [-DisableVerboseLogging] -Endpoint <String> [-IgnoreCertificateError] -Password <SecureString> [-Username <String>] [<CommonParameters>]

Connect-Pfa2Array [-ApiVersion <String>] -Credential <PSCredential> [-DisableVerboseLogging] -Endpoint <String> [-IgnoreCertificateError] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiClientName</nobr> | none | A user-specified name. The name must be locally unique and cannot be changed. | true | False | None |
| <nobr>ApiVersion</nobr> | none | alernative API version | false | False | None |
| <nobr>ClientId</nobr> | none | Client ID of the API client that issues the identity token. | true | False | None |
| <nobr>Credential</nobr> | none | The credentials for the FlashArray login | false | False | None |
| <nobr>DisableVerboseLogging</nobr> | none | Disables Phonehome logging of PureRESTPowershell activity on the FlashArray | false | False | False |
| <nobr>Endpoint</nobr> | none | The FlashArray name or IP address | true | False | None |
| <nobr>IgnoreCertificateError</nobr> | none | Prevents certificate errors such as an unknown certificate issuer or non-matching names from causing the request to fail. | false | False | False |
| <nobr>Issuer</nobr> | none | The name of the identity provider that will be issuing ID Tokens for this API client. This string represents the JWT iss \\(issuer\) claim in ID Tokens issued for this API client. | true | False | None |
| <nobr>KeyId</nobr> | none | Key ID of the API client that issues the identity token. | true | False | None |
| <nobr>Password</nobr> | none | Password associated with the login name of the array user. | true | False | None |
| <nobr>PrivateKeyFile</nobr> | none | Local file path for the PEM encoded private key certificate. | true | False | None |
| <nobr>PrivateKeyPassword</nobr> | none | Password, if any, for the PEM encoded private key certificate. | false | False | None |
| <nobr>Username</nobr> | none | Login name of the array user for whom the token should be issued. This must be a valid user in the system. | true | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Connect-Pfa2Array -Endpoint $ArrayEndpoint -Username $ArrayUserName -ApiClientName $ApiClient.Name -Issuer $ApiClient.Issuer -ClientId $ApiClient.Id -KeyId $ApiClient.KeyId -PrivateKeyFile $PrivateKeyFile -PrivateKeyPassword $PrivateKeyPassword -IgnoreCertificateError
```
Create a session with FlashArray using API client name, issuer, API keyid and API client id. The API client can be created using New-Pfa2ApiClient

**Example 2**
```powershell
Connect-Pfa2Array -Endpoint $ArrayEndpoint -Username $ArrayUserName -ApiClientName $ApiClient.Name -Issuer $ApiClient.Issuer -ClientId $ApiClient.Id -KeyId $ApiClient.KeyId -PrivateKeyFile $PrivateKeyFile -PrivateKeyPassword $PrivateKeyPassword -ApiVersion $_ -IgnoreCertificateError
```
Create a session with FlashArray using a specific REST version with ApiVersion param

**Example 3**
```powershell
Connect-Pfa2Array -Endpoint $ArrayEndpoint -Username $ArrayUserName -Password $psw -IgnoreCertificateError -ApiVersion $Version
```
Create a session with the $TargetEndPoint using username $ArrayUserName and secure string password $psw. User ApiVersion to connect to specific REST version. The FlashArray authentication is cached for the duration of the PowerShell session. No -Array parameter is required for subsequent cmdlet for this PowerShell session

## Disconnect-Pfa2Array
### Synopsis
Close OAuth2 Authentication
### Syntax
```powershell

Disconnect-Pfa2Array [-Array <Rest2Api>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Array</nobr> | none | The FlashArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Disconnect-Pfa2Array -Array $Array
```
Disconnect a session with FlashArray

## Get-Pfa2Admin
### Synopsis
List administrators
### Syntax
```powershell

Get-Pfa2Admin [-ApiVersion <String>] [-Array <Rest2Api>] [-ExposeApiToken <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>ExposeApiToken</nobr> | none | If \\`true\\`, exposes the API token of the current user. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Admin -Array $Array
```
Get a list of administrators from FlashArray

**Example 2**
```powershell
Get-Pfa2Admin -Array $Array | Where { $_.Name -eq $Name }
```
Get a list of array administrators and client filters the admins equal $Name

## Get-Pfa2AdminApiToken
### Synopsis
List API tokens
### Syntax
```powershell

Get-Pfa2AdminApiToken [-ApiVersion <String>] [-Array <Rest2Api>] [-ExposeApiToken <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>ExposeApiToken</nobr> | none | If \\`true\\`, exposes the API token of the current user. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2AdminApiToken -Array $Array
```
Get all administrators API token, API token is not exposed.

**Example 2**
```powershell
Get-Pfa2AdminApiToken -Array $Array -ExposeApiToken $True
```
Get array administrator's API token, API token of current admin is exposed.

**Example 3**
```powershell
Get-Pfa2AdminApiToken -Array $Array -Name $ArrayUsername
```
Get API token of array administrator whose name is $ArrayUsername

## Get-Pfa2AdminCache
### Synopsis
List administrator cache entries
### Syntax
```powershell

Get-Pfa2AdminCache [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2AdminCache -Array $Array -Name $Admin.Name
```
Get admin cache for array admin $Admin.Name on FlashArray

**Example 2**
```powershell
Get-Pfa2AdminCache -Array $Array | Where-Object { $_.Name -eq $Admin.Name }
```
Get all array administrators cache and client filter only $Admin.Name

## Get-Pfa2AdminSetting
### Synopsis
List administrator settings
### Syntax
```powershell

Get-Pfa2AdminSetting [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2AdminSetting -Array $Array
```
Get global array admin setting

## Get-Pfa2Alert
### Synopsis
List alerts
### Syntax
```powershell

Get-Pfa2Alert [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Flagged <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Flagged</nobr> | none | If set to \\`true\\`, lists only flagged messages. If set to \\`false\\`, lists only unflagged messages. if not specified, lists all messages. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Alert -Array $Array
```
Get all array alerts

**Example 2**
```powershell
Get-Pfa2Alert -Array $Array -Flagged $True
```
Get all array alerts that are flagged

**Example 3**
```powershell
Get-Pfa2Alert -Array $Array -Name $_.Name
```
Get array alert with name $\\_.Name

## Get-Pfa2AlertEvent
### Synopsis
List alert events
### Syntax
```powershell

Get-Pfa2AlertEvent [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Flagged <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Flagged</nobr> | none | If set to \\`true\\`, lists only flagged messages. If set to \\`false\\`, lists only unflagged messages. if not specified, lists all messages. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. For example, \\`name01\\`. Enter multiple names in comma-separated format. The \\`Ids\\` or \\`Name\\` parameter is required, but both cannot be set together. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2AlertEvent -Array $Array -Name $_.Name
```
Get array alert with name $\\_.Name

## Get-Pfa2ApiClient
### Synopsis
List API clients
### Syntax
```powershell

Get-Pfa2ApiClient [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ApiClient -Array $Array
```
Get API clients on FlashArray

## Get-Pfa2ApiVersion
### Synopsis
List array supported Api information and PowerShell supported Api information
### Syntax
```powershell

Get-Pfa2ApiVersion -Endpoint <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Endpoint</nobr> | none | The FlashArray name or IP address | true | False | None |
### Inputs
 - None

### Outputs
 - PureStorage.Rest.PureApiClientAuthInfo

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2App
### Synopsis
List apps
### Syntax
```powershell

Get-Pfa2App [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2App -Array $testarray
```
Get all of apps in PureArray

**Example 2**
```powershell
Get-Pfa2App -Array $testarray -Name $app.Name
```
Get a specific app in PureArray by name

## Get-Pfa2AppNode
### Synopsis
List app nodes
### Syntax
```powershell

Get-Pfa2AppNode [-ApiVersion <String>] [-AppNames <System.Collections.Generic.List`1[System.String]>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>AppNames</nobr> | none | The name of the installed app. Enter multiple names in comma-separated format. | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2AppNode -Array $testarray -AppNames $app.Name
```
Get an app and its node information in PureArray by name

## Get-Pfa2Array
### Synopsis
List arrays
### Syntax
```powershell

Get-Pfa2Array [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Array -Array $Array
```
Get FlashArray information

**Example 2**
```powershell
(Get-Pfa2Array -Array $Array).IdleTimeout
```
Get Idletimeout of the FlashArray

## Get-Pfa2ArrayEula
### Synopsis
List End User Agreement and signature
### Syntax
```powershell

Get-Pfa2ArrayEula [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ArrayEula -Array $Array
```
Get array eula information

## Get-Pfa2ArrayNtpTest
### Synopsis
List NTP test results
### Syntax
```powershell

Get-Pfa2ArrayNtpTest [-ApiVersion <String>] [-Array <Rest2Api>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ArrayNtpTest -array $Array
```
Get array NTP test result

## Get-Pfa2ArrayPerformance
### Synopsis
List array front-end performance data
### Syntax
```powershell

Get-Pfa2ArrayPerformance [-ApiVersion <String>] [-Array <Rest2Api>] [-EndTime <Int64>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Protocol <String>] [-ProtocolGroup <String>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Protocol</nobr> | none | Protocol type. Valid values are \\`nfs\\`, \\`smb\\`, and \\`all\\`. | false | False | None |
| <nobr>ProtocolGroup</nobr> | none | Protocol group type. Valid values are \\`block\\`, \\`file\\`, and \\`all\\`. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ArrayPerformance -Array $Array
```
Get array performance data

**Example 2**
```powershell
Get-Pfa2ArrayPerformance -Array $Array -StartTime $CurrentTimeAtYesterday -Endtime $CurrentTime -Resolution $ResolutionTime
```
Get array performance data starting from $CurrentTimeAtYesterday to $CurrentTime with a resolution of $ResolutionTime

## Get-Pfa2ArraySpace
### Synopsis
List array space information
### Syntax
```powershell

Get-Pfa2ArraySpace [-ApiVersion <String>] [-Array <Rest2Api>] [-EndTime <Int64>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ArraySpace  -Array $Array
```
Get array space data

**Example 2**
```powershell
Get-Pfa2ArraySpace  -Array $Array -StartTime $CurrentTimeAtYesterday -Endtime $CurrentTime -Resolution $ResolutionTime
```
Get array space data starting from $CurrentTimeAtYesterday to $CurrentTime with a resolution of $ResolutionTime

## Get-Pfa2Audit
### Synopsis
List audits
### Syntax
```powershell

Get-Pfa2Audit [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Audit -Array $Array | Where-Object { $_.Arguments.trim() -eq  $ProtectionGroupName }
```
Get audit of operations of which the argument is equal to $ProtectionGroupName

## Get-Pfa2Connection
### Synopsis
List volume connections
### Syntax
```powershell

Get-Pfa2Connection [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-HostGroupNames <System.Collections.Generic.List`1[System.String]>] [-HostNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Offset <Int32>] [-ProtocolEndpointNames <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-VolumeNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>HostGroupNames</nobr> | none | Performs the operation on the host group specified. Enter multiple names in comma-separated format. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple host group names and volume names; instead, at least one of the objects \\(e.g., \\`HostGroupNames\\`\) must be set to only one name \\(e.g., \\`hgroup01\\`\). | false | False | None |
| <nobr>HostNames</nobr> | none | Performs the operation on the hosts specified. Enter multiple names in comma-separated format. For example, \\`host01,host02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple host names and volume names; instead, at least one of the objects \\(e.g., \\`HostNames\\`\) must be set to only one name \\(e.g., \\`host01\\`\). | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>ProtocolEndpointNames</nobr> | none | Performs the operation on the protocol endpoints specified. Enter multiple names in comma-separated format. For example, \\`pe01,pe02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple protocol endpoint names and host names; instead, at least one of the objects \\(e.g., \\`ProtocolEndpointNames\\`\) must be set to one name \\(e.g., \\`pe01\\`\). | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>VolumeNames</nobr> | none | Performs the operation on the volume specified. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple volume names and host names; instead, at least one of the objects \\(e.g., \\`VolumeNames\\`\) must be set to only one name \\(e.g., \\`vol01\\`\). | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Connection -Array $Array -HostNames $Host_.Name
```
Get connections the host $Host\\_.Name is related with

**Example 2**
```powershell
Get-Pfa2Connection -Array $Array | Where { $_.Host.Name -eq $Host_.Name -and $_.Volume.Name -eq $Volume.Name }
```
Get all of connections and filter by connection host name and volume name

**Example 3**
```powershell
(Get-Pfa2Connection -Array $Array -HostNames $Host_.Name).Volume
```
Get the volumes that host $Host\\_.Name connects with

**Example 4**
```powershell
Get-Pfa2Connection -Array $Array -HostGroupNames $HostGroup.Name
```
Get connections the host group $HostGroup.Name is related with

**Example 5**
```powershell
(Get-Pfa2Connection -Array $Array -HostGroupNames $HostGroup.Name).Volume
```
Get the volumes that host group $HostGroup.Name connects with

## Get-Pfa2Controller
### Synopsis
List controller information and status
### Syntax
```powershell

Get-Pfa2Controller [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Controller -Array $Array
```
Get controller information of the FlashArray

## Get-Pfa2DirectoryService
### Synopsis
List directory services configuration
### Syntax
```powershell

Get-Pfa2DirectoryService [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2DirectoryService -Array $Array
```
Get directory service information of the FlashArray

**Example 2**
```powershell
(Get-Pfa2DirectoryService -Array $Array).Name
```
Get name list of all of directory services

## Get-Pfa2DirectoryServiceRole
### Synopsis
List directory services roles
### Syntax
```powershell

Get-Pfa2DirectoryServiceRole [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-RoleNames <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>RoleNames</nobr> | none | Performs the operation on the unique roles specified. For example, \\`array\\_admin\\`. Enter multiple roles in comma-separated format. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2DirectoryServiceRole -Array $Array -RoleNames $ArrayAdmin
```
Get directory service role information of the FlashArray by role name $ArrayAdmin

**Example 2**
```powershell
Get-Pfa2DirectoryServiceRole -Array $Array
```
Get information of all of directory service roles

## Get-Pfa2DirectoryServiceTest
### Synopsis
List directory services test results
### Syntax
```powershell

Get-Pfa2DirectoryServiceTest [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] -Name <String> [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. For example, \\`name01\\`. Enter multiple names in comma-separated format. | true | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2DirectoryServiceTest -Array $Array -Name $Name
```
Test directory service named $Name

## Get-Pfa2Dns
### Synopsis
List DNS parameters
### Syntax
```powershell

Get-Pfa2Dns [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2DNS -Array $Array
```
Get dns informaion of the FlashArray

## Get-Pfa2Hardware
### Synopsis
List hardware component information
### Syntax
```powershell

Get-Pfa2Hardware [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2Host
### Synopsis
List hosts
### Syntax
```powershell

Get-Pfa2Host [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Host -Array $Array -Name $HostName
```
Get a host by name

**Example 2**
```powershell
Get-Pfa2Host -Array $Array | Where-Object{ $_.Name -eq $HostName }
```
Get all of hosts and filter by name $HostName

**Example 3**
```powershell
Get-Pfa2Host -Array $Array
```
Get all hosts from FlashArray

## Get-Pfa2HostGroup
### Synopsis
List host groups
### Syntax
```powershell

Get-Pfa2HostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostGroup -Array $Array -Name $HostGroupName
```
Get a host group named $HostGroupName

**Example 2**
```powershell
Get-Pfa2HostGroup -Array $Array | Where-Object { $_.Name -eq $NewHostGroupName }
```
Get all of the host groups and filter by name $NewHostGroupName

**Example 3**
```powershell
Get-Pfa2HostGroup -Array $Array
```
Get all host groups on FlashArray

## Get-Pfa2HostGroupHost
### Synopsis
List host groups that are associated with hosts
### Syntax
```powershell

Get-Pfa2HostGroupHost [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostGroupHost -Array $Array -GroupNames $HostGroupName
```
Get all of hosts added to host group $HostGroupName

## Get-Pfa2HostGroupPerformance
### Synopsis
List host group performance data
### Syntax
```powershell

Get-Pfa2HostGroupPerformance [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostGroupPerformance -Array $Array -Name $HostGroupName
```
Get performance data of host group $HostGroupName

**Example 2**
```powershell
Get-Pfa2HostGroupPerformance -Array $Array | Where-Object { $_.Name -eq $HostGroupName }
```
Get performance data of all host groups and filter by host group name $HostGroupName

## Get-Pfa2HostGroupPerformanceByArray
### Synopsis
List host group performance data by array
### Syntax
```powershell

Get-Pfa2HostGroupPerformanceByArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostGroupPerformanceByArray -Array $Array | Where-Object { $_.Name -eq $HostGroupName }
```
Get performance data of all host groups by array and filter by host group name $HostGroupName

## Get-Pfa2HostGroupProtectionGroup
### Synopsis
List host groups that are members of protection groups
### Syntax
```powershell

Get-Pfa2HostGroupProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostGroupProtectionGroup -Array $Array -GroupNames $ProtectionGroupName
```
Get all of host groups that are added to protection group $ProtectionGroupName

## Get-Pfa2HostGroupSpace
### Synopsis
List host group space information
### Syntax
```powershell

Get-Pfa2HostGroupSpace [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostGroupSpace -Array $Array | Where-Object { $_.Name -eq $HostGroupName }
```
Get space data of all of host groups and filter by host group name $HostName

**Example 2**
```powershell
Get-Pfa2HostGroupSpace -Array $Array -Name $HostGroupName
```
Get space data of host group named $HostGroupName

## Get-Pfa2HostHostGroup
### Synopsis
List hosts that are associated with host groups
### Syntax
```powershell

Get-Pfa2HostHostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostHostGroup -Array $Array -GroupNames $HostGroupName
```
Get all of hosts added to host group $HostGroupName

## Get-Pfa2HostPerformance
### Synopsis
List host performance data
### Syntax
```powershell

Get-Pfa2HostPerformance [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostPerformance -Array $Array -Name $HostName
```
Get performance data of host $HostName

**Example 2**
```powershell
Get-Pfa2HostPerformance -Array $Array | Where-Object { $_.Name -eq $HostName }
```
Get performance data of all hosts and filter by host name $HostName

## Get-Pfa2HostPerformanceByArray
### Synopsis
List host performance data by array
### Syntax
```powershell

Get-Pfa2HostPerformanceByArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostPerformanceByArray -Array $Array | Where-Object { $_.Name -eq $HostName }
```
Get performance data of all hosts by array and filter by host name $HostName

## Get-Pfa2HostProtectionGroup
### Synopsis
List hosts that are members of protection groups
### Syntax
```powershell

Get-Pfa2HostProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostProtectionGroup -Array $Array -GroupNames $ProtectionGroupName
```
Get all of hosts that are added to protection group $ProtectionGroupName

## Get-Pfa2HostSpace
### Synopsis
List host space information
### Syntax
```powershell

Get-Pfa2HostSpace [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2HostSpace -Array $Array | Where-Object { $_.Name -eq $HostName }
```
Get space data of all of hosts and filter by host name $HostName

**Example 2**
```powershell
Get-Pfa2HostSpace -Array $Array -Name $HostName
```
Get space data of host named $HostName

## Get-Pfa2Kmip
### Synopsis
List KMIP server objects
### Syntax
```powershell

Get-Pfa2Kmip [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Kmip -Array $Array
```
Get list of kmip servers configured on FlashArray

**Example 2**
```powershell
Get-Pfa2Kmip -Name $kmipName -Array $Array
```
Get a Kmip server by name $kmipName

**Example 3**
```powershell
Get-Pfa2Kmip -Array $Array | Where-Object {$_.Name -eq $kmipName}
```
Get all of Kmip servers and filter by name $kmipName

## Get-Pfa2KmipTest
### Synopsis
Lists KMIP connection tests
### Syntax
```powershell

Get-Pfa2KmipTest [-ApiVersion <String>] [-Array <Rest2Api>] -Name <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. For example, \\`name01\\`. Enter multiple names in comma-separated format. | true | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2KmipTest -Array $testarray -Name $kmipName
```
Test KMIP server previously configured using name $kmipName

## Get-Pfa2MaintenanceWindow
### Synopsis
List maintenance window details
### Syntax
```powershell

Get-Pfa2MaintenanceWindow [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2MaintenanceWindow -Array $Array -Name "environment"
```
Get information of maintenance window named "environment"

**Example 2**
```powershell
Get-Pfa2MaintenanceWindow -Array $Array | ForEach-Object {
```
Get all of maintenance windows and loop through it

## Get-Pfa2Offload
### Synopsis
List offload targets
### Syntax
```powershell

Get-Pfa2Offload [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Protocol <String>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Protocol</nobr> | none | Protocol type. Valid values are \\`azure\\`, \\`google-cloud\\`, \\`nfs\\`, and \\`s3\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Offload -Array $Array | Where-Object {$_.Name -eq $NFSTargetName}
```
Get all of offload targets of the FlashArray and fliter by name $NFSTargetName

## Get-Pfa2Pod
### Synopsis
List pods
### Syntax
```powershell

Get-Pfa2Pod [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Pod -Array $Array
```
Get all PODs from FlashArray

## Get-Pfa2PodArray
### Synopsis
List pods and their the array members
### Syntax
```powershell

Get-Pfa2PodArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupIds <System.Collections.Generic.List`1[System.String]>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberIds <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupIds</nobr> | none | A list of group IDs. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberIds</nobr> | none | A list of member IDs. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2PodPerformance
### Synopsis
List pod performance data
### Syntax
```powershell

Get-Pfa2PodPerformance [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2PodPerformanceByArray
### Synopsis
List pod performance data by array
### Syntax
```powershell

Get-Pfa2PodPerformanceByArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2PodPerformanceReplication
### Synopsis
List pod replication performance data
### Syntax
```powershell

Get-Pfa2PodPerformanceReplication [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2PodPerformanceReplicationByArray
### Synopsis
List pod replication performance data by array
### Syntax
```powershell

Get-Pfa2PodPerformanceReplicationByArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2PodReplicaLink
### Synopsis
List pod replica links
### Syntax
```powershell

Get-Pfa2PodReplicaLink [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-LocalPodIds <System.Collections.Generic.List`1[System.String]>] [-LocalPodNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-RemoteIds <System.Collections.Generic.List`1[System.String]>] [-RemoteNames <System.Collections.Generic.List`1[System.String]>] [-RemotePodIds <System.Collections.Generic.List`1[System.String]>] [-RemotePodNames <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`names\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>LocalPodIds</nobr> | none | A list of local pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodNames\\` query parameter. | false | False | None |
| <nobr>LocalPodNames</nobr> | none | A list of local pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodIds\\` query parameter. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>RemoteIds</nobr> | none | A list of remote array IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteNames\\` query parameter. | false | False | None |
| <nobr>RemoteNames</nobr> | none | A list of remote array names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteIds\\` query parameter. | false | False | None |
| <nobr>RemotePodIds</nobr> | none | A list of remote pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodNames\\` query parameter. | false | False | None |
| <nobr>RemotePodNames</nobr> | none | A list of remote pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodIds\\` query parameter. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2PodReplicaLink -Array $Array
```
Get POD replica links from FlashArray

**Example 2**
```powershell
Get-Pfa2PodReplicaLink -Array $Array -LocalPodNames $LocalPodName -RemotePodNames $RemotePodName
```
Get POD replica links from FlashArray where local pod names is $LocalPodName and remote pod names is $RemotePodName

## Get-Pfa2PodReplicaLinkLag
### Synopsis
List pod replica link lag objects.
### Syntax
```powershell

Get-Pfa2PodReplicaLinkLag [-ApiVersion <String>] [-Array <Rest2Api>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-LocalPodIds <System.Collections.Generic.List`1[System.String]>] [-LocalPodNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-RemoteIds <System.Collections.Generic.List`1[System.String]>] [-RemoteNames <System.Collections.Generic.List`1[System.String]>] [-RemotePodIds <System.Collections.Generic.List`1[System.String]>] [-RemotePodNames <System.Collections.Generic.List`1[System.String]>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`names\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>LocalPodIds</nobr> | none | A list of local pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodNames\\` query parameter. | false | False | None |
| <nobr>LocalPodNames</nobr> | none | A list of local pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodIds\\` query parameter. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>RemoteIds</nobr> | none | A list of remote array IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteNames\\` query parameter. | false | False | None |
| <nobr>RemoteNames</nobr> | none | A list of remote array names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteIds\\` query parameter. | false | False | None |
| <nobr>RemotePodIds</nobr> | none | A list of remote pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodNames\\` query parameter. | false | False | None |
| <nobr>RemotePodNames</nobr> | none | A list of remote pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodIds\\` query parameter. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2PodReplicaLinkLag -Array $Array
```
Get all POD replica-link lag from FlashArray

## Get-Pfa2PodReplicaLinkPerformanceReplication
### Synopsis
List array pod replica performance data.
### Syntax
```powershell

Get-Pfa2PodReplicaLinkPerformanceReplication [-ApiVersion <String>] [-Array <Rest2Api>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-LocalPodIds <System.Collections.Generic.List`1[System.String]>] [-LocalPodNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-RemoteIds <System.Collections.Generic.List`1[System.String]>] [-RemoteNames <System.Collections.Generic.List`1[System.String]>] [-RemotePodIds <System.Collections.Generic.List`1[System.String]>] [-RemotePodNames <System.Collections.Generic.List`1[System.String]>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`names\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>LocalPodIds</nobr> | none | A list of local pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodNames\\` query parameter. | false | False | None |
| <nobr>LocalPodNames</nobr> | none | A list of local pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodIds\\` query parameter. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>RemoteIds</nobr> | none | A list of remote array IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteNames\\` query parameter. | false | False | None |
| <nobr>RemoteNames</nobr> | none | A list of remote array names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteIds\\` query parameter. | false | False | None |
| <nobr>RemotePodIds</nobr> | none | A list of remote pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodNames\\` query parameter. | false | False | None |
| <nobr>RemotePodNames</nobr> | none | A list of remote pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodIds\\` query parameter. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2PodReplicaLinkPerformanceReplication -Array $Array
```
Get all POD replica-link replication performance statistics on FlashArray

**Example 2**
```powershell
Get-Pfa2PodReplicaLinkPerformanceReplication -Array $Array -LocalPodNames $LocalPodName -RemoteNames $TargetEndPoint -RemotePodNames $RemotePodName
```
Get POD replica-link replication performance on FlashArray where LocalPodNames is $LocalPodName and RemoteNames is $TargetEndPoint and RemotePodNames is $RemotePodName

## Get-Pfa2PodSpace
### Synopsis
List pod space information
### Syntax
```powershell

Get-Pfa2PodSpace [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2Port
### Synopsis
List ports
### Syntax
```powershell

Get-Pfa2Port [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Port -Array $Array
```
Get all ports from FlashArray

## Get-Pfa2PortInitiator
### Synopsis
List port initiators
### Syntax
```powershell

Get-Pfa2PortInitiator [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2PortInitiator -Array $Array
```
Get all port initiators from FlashArray

## Get-Pfa2ProtectionGroup
### Synopsis
List protection groups
### Syntax
```powershell

Get-Pfa2ProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroup -Array $Array -Name $ProtectionGroupName
```
Get protection group from FlashArray where name is $ProtectionGroupName

**Example 2**
```powershell
Get-Pfa2ProtectionGroup -Array $Array | Where-Object { $_.Name -eq $NewProtectionGroupName }
```
Get all protection groups from FlashArray and client filters locally using Where-Object

**Example 3**
```powershell
Get-Pfa2ProtectionGroup -Array $Array -Destroyed $false
```
Get all protection groups from FlashArray which are currently not destroyed

## Get-Pfa2ProtectionGroupHost
### Synopsis
List protection groups with host members
### Syntax
```powershell

Get-Pfa2ProtectionGroupHost [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupHost -Array $Array -GroupNames $ProtectionGroupName
```
Get all hosts in a protection group $ProtectionGroupName on FlashArray

## Get-Pfa2ProtectionGroupHostGroup
### Synopsis
List protection groups with host group members
### Syntax
```powershell

Get-Pfa2ProtectionGroupHostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupHostGroup -Array $Array -GroupNames $ProtectionGroupName
```
Get all host groups in protection group $ProtectionGroupName

## Get-Pfa2ProtectionGroupPerformanceReplication
### Synopsis
List protection group replication performance data
### Syntax
```powershell

Get-Pfa2ProtectionGroupPerformanceReplication [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupPerformanceReplication -Array $Array | Where-Object { $_.Name -eq $ProtectionGroupName }
```
Get all protection group replication performance statistics from FlashArray and client locally filters with name $ProtectionGroupName

## Get-Pfa2ProtectionGroupPerformanceReplicationByArray
### Synopsis
List protection group replication performance data with array details
### Syntax
```powershell

Get-Pfa2ProtectionGroupPerformanceReplicationByArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupPerformanceReplicationByArray -Array $Array | Where-Object { $_.Name -eq $ProtectionGroupName }
```
Get all protection group performance replication statistics by Array on FlashArray and client locally filters with name $ProtectionGroupName

## Get-Pfa2ProtectionGroupSnapshot
### Synopsis
List protection group snapshots
### Syntax
```powershell

Get-Pfa2ProtectionGroupSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupSnapshot -Array $Array | Where-Object {$_.Name -eq $NewSnapshotName}
```
Get protection group snapshots from FlashArray and filter locally where name is $NewSnapshotName

## Get-Pfa2ProtectionGroupSnapshotTransfer
### Synopsis
List protection group snapshots with transfer statistics
### Syntax
```powershell

Get-Pfa2ProtectionGroupSnapshotTransfer [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupSnapshotTransfer -Array $Array -Name $Response.Name -Destroyed $false
```
Get protection group snapshot transfer statistics where group name is $Response.Name and group is not destroyed

**Example 2**
```powershell
Get-Pfa2ProtectionGroupSnapshotTransfer -Array $Array -Destroyed $false | Where-Object {$_.Name -eq $DefaultSnapshotName}
```
Get all protection group snapshot transfer statistics where groups are destroyed and filter locally

## Get-Pfa2ProtectionGroupSpace
### Synopsis
List protection group space information
### Syntax
```powershell

Get-Pfa2ProtectionGroupSpace [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupSpace -Array $Array | Where-Object { $_.Name -eq $ProtectionGroupName }
```
Get all protection group space statistics on FlashArray  and client locally filters where name is $ProtectionGroupName

**Example 2**
```powershell
Get-Pfa2ProtectionGroupSpace -Array $Array -Name $ProtectionGroupName
```
Get protection group space statistics for $ProtectionGroupName

## Get-Pfa2ProtectionGroupTarget
### Synopsis
List protection groups with targets
### Syntax
```powershell

Get-Pfa2ProtectionGroupTarget [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupTarget -Array $testarray -GroupNames $ProtectionGroupName
```
Get all of targets added to protection group named $ProtectionGroupName

## Get-Pfa2ProtectionGroupVolume
### Synopsis
List protection groups with volume members
### Syntax
```powershell

Get-Pfa2ProtectionGroupVolume [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2ProtectionGroupVolume -Array $Array -GroupNames $ProtectionGroupName
```
Get all volumes in a protection group $ProtectionGroupName

## Get-Pfa2RemotePod
### Synopsis
List remote pods
### Syntax
```powershell

Get-Pfa2RemotePod [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-On <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. Enter multiple target names in comma-separated format. For example, \\`targetName01,targetName02\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2RemotePod -Array $Array
```
Get remote pods from the FlashArray connected to $TestArray

## Get-Pfa2RemoteProtectionGroup
### Synopsis
List remote protection groups
### Syntax
```powershell

Get-Pfa2RemoteProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-On <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. Enter multiple target names in comma-separated format. For example, \\`targetName01,targetName02\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2RemoteProtectionGroup -Array $Array -On $OffloadTargetName -Name $RemotePGName
```
Get protection group $RemotePGName on offload target $OffloadTargetName

## Get-Pfa2RemoteProtectionGroupSnapshot
### Synopsis
List remote protection group snapshots
### Syntax
```powershell

Get-Pfa2RemoteProtectionGroupSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-On <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. Enter multiple target names in comma-separated format. For example, \\`targetName01,targetName02\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2RemoteProtectionGroupSnapshot -Array $Array | Where-Object { $_.name -eq $PeergroupSnapshot }
```
Get all of remote protection group snapshots of the FlashArray and then filter by name $PeergroupSnapshot

**Example 2**
```powershell
Get-Pfa2RemoteProtectionGroupSnapshot -Array $Array -On $OffloadTargetName -Name $RemotePGName
```
Get all snapshots on offload target $OffloadTargetName for protection group $RemotePGName

## Get-Pfa2RemoteProtectionGroupSnapshotTransfer
### Synopsis
List remote protection groups with transfer statistics
### Syntax
```powershell

Get-Pfa2RemoteProtectionGroupSnapshotTransfer [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-On <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. Enter multiple target names in comma-separated format. For example, \\`targetName01,targetName02\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2RemoteProtectionGroupSnapshotTransfer -Array $Array -On 'nfstarget' -Name $RemotePGSnapshotName
```
Get remote protection group snapshot transfer statistics for $RemotePGSnapshotName to offload target "nfstarget" on FlashArray

## Get-Pfa2RemoteVolumeSnapshot
### Synopsis
List remote volume snapshots
### Syntax
```powershell

Get-Pfa2RemoteVolumeSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-On <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceIds <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. Enter multiple target names in comma-separated format. For example, \\`targetName01,targetName02\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceIds</nobr> | none | Performs the operation on the source ID specified. Enter multiple source IDs in comma-separated format. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2RemoteVolumeSnapshot -Array $Array -On "nfstarget" | Where-Object { $_.Name -eq $ExpectedRemoteVolumeSnapshotName }
```
Get all remote volume snapshots present on offload target "nfstarget" on FlashArray and client locally filters where name is $ExpectedRemoteVolumeSnapshotName

## Get-Pfa2RemoteVolumeSnapshotTransfer
### Synopsis
List remote volume snapshots with transfer statistics
### Syntax
```powershell

Get-Pfa2RemoteVolumeSnapshotTransfer [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-On <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceIds <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. Enter multiple target names in comma-separated format. For example, \\`targetName01,targetName02\\`. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceIds</nobr> | none | Performs the operation on the source ID specified. Enter multiple source IDs in comma-separated format. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2RemoteVolumeSnapshotTransfer -Array $Array -On "nfstarget" | Where-Object { $_.Name -eq $ExpectedRemoteVolumeSnapshotName }
```
Get all remote volume snapshot transfer statistics to offload target "nfstarget" and client locally filters where name is $ExpectedRemoteVolumeSnapshotName

**Example 2**
```powershell
Get-Pfa2RemoteVolumeSnapshotTransfer -Array $Array -On "nfstarget" -Name $ExpectedRemoteVolumeSnapshotName
```
Get remote volume snapshot transfer statistics to offload target "nfstarget" for snapshot name $ExpectedRemoteVolumeSnapshotName

## Get-Pfa2SmiS
### Synopsis
List SMI-S settings
### Syntax
```powershell

Get-Pfa2SmiS [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2SMIS -Array $Array
```
Get SMI-S information of the FlashArray

## Get-Pfa2Software
### Synopsis
List software packages
### Syntax
```powershell

Get-Pfa2Software [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-Versions <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>Versions</nobr> | none | A list of versions. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2SoftwareInstallation
### Synopsis
List software upgrades
### Syntax
```powershell

Get-Pfa2SoftwareInstallation [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-SoftwareIds <System.Collections.Generic.List`1[System.String]>] [-SoftwareNames <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>SoftwareIds</nobr> | none | A list of software IDs. | false | False | None |
| <nobr>SoftwareNames</nobr> | none | A list of software names. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2SoftwareInstallationStep
### Synopsis
List software upgrade steps
### Syntax
```powershell

Get-Pfa2SoftwareInstallationStep [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-SoftwareInstallationIds <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>SoftwareInstallationIds</nobr> | none | A list of software installation IDs. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Get-Pfa2Subnet
### Synopsis
List subnets
### Syntax
```powershell

Get-Pfa2Subnet [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
@(Get-Pfa2Subnet -Array $Array).count
```
Get the number of subnet of FlashArray

**Example 2**
```powershell
Get-Pfa2Subnet -Array $Array -Name $Name
```
Get a subnet of FlashArray with a specific name

## Get-Pfa2Support
### Synopsis
List connection paths
### Syntax
```powershell

Get-Pfa2Support [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Support -Array $Array
```
Get connection paths between the current array and each connected array

## Get-Pfa2SupportTest
### Synopsis
List Pure Technical Services connection data
### Syntax
```powershell

Get-Pfa2SupportTest [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-TestType <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>TestType</nobr> | none | Specifies the type of test. Valid values are \\`all\\`, \\`phonehome\\`, and \\`remote-assist\\`. If not specified, defaults to \\`all\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2SupportTest -Array $Array
```
Get information about whether the array can connect to Pure Storage Support

## Get-Pfa2Volume
### Synopsis
List volumes
### Syntax
```powershell

Get-Pfa2Volume [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2Volume -Array $Array
```
Get volumes from FlashArray

**Example 2**
```powershell
Get-Pfa2Volume -Array $Array | Where { $_.VolumeGroup.Name -eq $VolGroup.Name } | ForEach-Object {
```
Get all volume from FlashArray and locally filter and operate only on volumes whose VolumeGroup is $VolGroup.Name

**Example 3**
```powershell
Get-Pfa2Volume -Array $Array -Name $NewVolumeName
```
Get volume named $NewVolumeName

**Example 4**
```powershell
Get-Pfa2Volume -Array $Array -Limit $Limit
```
Get a limited set of volumes from FlashArray defined by $Limit \\(See -Offset\)

**Example 5**
```powershell
Get-Pfa2Volume -Array $Array -Offset $Limit
```
Get all volumes from offset $Limit \\(See -Limit\)

**Example 6**
```powershell
'*$($NamePrefix)*'" -Destroyed $False | Update-Pfa2Volume -Array $Array -Destroyed $True
```
Get all non-destroyed volumes from FlashArray using server side filtering \\(See \\`help About\\_Pfa2Filtering\\` on PowerShell\) and destroy all at once using pipeline

**Example 7**
```powershell
'*$($NamePrefix)*'" -Destroyed $True | Remove-Pfa2Volume -Array $Array -Eradicate -Confirm:$false
```
Get all destroyed volumes using server side filtering and eradicate them

**Example 8**
```powershell
Get-Pfa2Volume -Array $Array -Filter "name = '$($Volumes[2].Name)'"
```
Get all volumes using server side filtering where name equals "$\\($Volumes\\[2\\].Name\)". See \\`help About\\_Pfa2Filtering\\` on PowerShell window

**Example 9**
```powershell
Get-Pfa2Volume -Array $Array -Sort "provisioned"
```
Get all volumes on FlashArray with server side sorted list. Sorted by field "provisioned"

**Example 10**
```powershell
Get-Pfa2Volume
```
Get all volumes from FlashArray. Here the FlashArray authentication information is retrieved from Cache. Please see Connect-Pfa2Array

**Example 11**
```powershell
Get-Pfa2Volume -Filter "name ='$($prefix)*'"
```
Get all volumes from FlashArray with name $prefix using Server side filtering. Here the FlashArray authentication information is retrieved from Cache. Please see Connect-Pfa2Array

**Example 12**
```powershell
Get-Pfa2Volume -Filter "name ='$($prefix)*'" -Limit $limit
```
Get only a limited set of volumes from FlashArray with name $prefix using Server side filtering. The limit is defined by $Limit

**Example 13**
```powershell
Get-Pfa2Volume -Filter "name ='$($prefix)*'" -Limit $limit -Offset $offset
```
Get only a limited set of volumes from a given $offset from FlashArray with name $prefix using Server side filtering. The limit is defined by $Limit

## Get-Pfa2VolumeGroup
### Synopsis
List volume groups
### Syntax
```powershell

Get-Pfa2VolumeGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeGroup -Array $Array | Where { $_.Name.Contains($prefix) }
```
Get all volume group from FlashArray and locally filter where name contains a prefix

**Example 2**
```powershell
Get-Pfa2VolumeGroup -Array $Array -Name $VolumeGroup.Name
```
Get volume group named $VolumeGroup.Name

## Get-Pfa2VolumeGroupPerformance
### Synopsis
List volume group performance data
### Syntax
```powershell

Get-Pfa2VolumeGroupPerformance [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeGroupPerformance -Array $Array -Name $VolumeGroup.Name
```
Get performance data of the volume group named $VolumeGroup.Name

## Get-Pfa2VolumeGroupSpace
### Synopsis
List volume group space information
### Syntax
```powershell

Get-Pfa2VolumeGroupSpace [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeGroupSpace -Array $Array -Ids $VolumeGroup.Id
```
Get space data of the volume group having id of $VolumeGroup.Id

## Get-Pfa2VolumeGroupVolume
### Synopsis
List volume groups with volumes
### Syntax
```powershell

Get-Pfa2VolumeGroupVolume [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupIds <System.Collections.Generic.List`1[System.String]>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberIds <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupIds</nobr> | none | A list of group IDs. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberIds</nobr> | none | A list of member IDs. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeGroupVolume -Array $Array -GroupIds $VolumeGroup.Id
```
Get volumes that are added to volume group of which the group id is $VolumeGroup.Id

## Get-Pfa2VolumePerformance
### Synopsis
List volume performance data
### Syntax
```powershell

Get-Pfa2VolumePerformance [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumePerformance -Array $Array -Name $Volume.Name
```
Get volume performance statistics on FlashArray

## Get-Pfa2VolumePerformanceByArray
### Synopsis
List volume performance data by array
### Syntax
```powershell

Get-Pfa2VolumePerformanceByArray [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumePerformanceByArray -Array $Array -Name $Volume.Name
```
Get volume performance statistics by array on FlashArray

## Get-Pfa2VolumeProtectionGroup
### Synopsis
List volumes that are members of protection groups
### Syntax
```powershell

Get-Pfa2VolumeProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeProtectionGroup -Array $Array -GroupNames $PG.Name
```
Get protection  group from FlashArray with names $PG.Name

## Get-Pfa2VolumeSnapshot
### Synopsis
List volume snapshots
### Syntax
```powershell

Get-Pfa2VolumeSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceIds <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceIds</nobr> | none | Performs the operation on the source ID specified. Enter multiple source IDs in comma-separated format. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeSnapshot -Array $Array -SourceNames $Volume.Name
```
Get all snapshots for volume $Volume.Name on FlashArray

## Get-Pfa2VolumeSnapshotTags
### Synopsis
List tags
### Syntax
```powershell

Get-Pfa2VolumeSnapshotTags [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-ResourceDestroyed <Boolean>] [-ResourceIds <System.Collections.Generic.List`1[System.String]>] [-ResourceNames <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>ResourceDestroyed</nobr> | none | If set to \\`true\\`, returns only objects from destroyed resources. Returns an error if the name of a live resource is specified in the \\`ResourceNames\\` query parameter. If set to \\`false\\`, returns only objects from live resources. Returns an error if the name of a destroyed resource is specified in the \\`ResourceNames\\` query parameter. | false | False | None |
| <nobr>ResourceIds</nobr> | none | A list of resource IDs. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>ResourceNames</nobr> | none | A list of resource names. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeSnapshotTags -Array $Array -ResourceNames $Result.Name
```
Get all tags for volume snapshot with name $Result.Name on FlashArray

**Example 2**
```powershell
Get-Pfa2VolumeSnapshotTags -Array $Array
```
Get all tags for all volume snapshots on FlashArray

## Get-Pfa2VolumeSnapshotTransfer
### Synopsis
List volume snapshots with transfer statistics
### Syntax
```powershell

Get-Pfa2VolumeSnapshotTransfer [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-SourceIds <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>SourceIds</nobr> | none | Performs the operation on the source ID specified. Enter multiple source IDs in comma-separated format. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeSnapshotTransfer -Array $Array -Name $VolumeSnapshot.Name
```
Get volume snapshot transfer statistics for snapshot $VolumeSnapshot.name on FlashArray

## Get-Pfa2VolumeSpace
### Synopsis
List volume space information
### Syntax
```powershell

Get-Pfa2VolumeSpace [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-EndTime <Int64>] [-Filter <String>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-Name <String>] [-Offset <Int32>] [-Resolution <Int64>] [-Sort <System.Collections.Generic.List`1[System.String]>] [-StartTime <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, lists only destroyed objects that are in the eradication pending state. If set to \\`false\\`, lists only objects that are not destroyed. For destroyed objects, the time remaining is displayed in seconds. | false | False | None |
| <nobr>EndTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Resolution</nobr> | none | The number of milliseconds between samples of historical data. For array-wide performance metrics \\(\\`/arrays/performance\\` endpoint\), valid values are \\`1000\\` \\(1 second\), \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For performance metrics on storage objects \\(\\`\<object name\\>/performance\\` endpoint\), such as volumes, valid values are \\`30000\\` \\(30 seconds\), \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). For space metrics, \\(\\`\<object name\\>/space\\` endpoint\), valid values are \\`300000\\` \\(5 minutes\), \\`1800000\\` \\(30 minutes\), \\`7200000\\` \\(2 hours\), \\`28800000\\` \\(8 hours\), and \\`86400000\\` \\(24 hours\). Include the \\`StartTime\\` parameter to display the performance data starting at the specified start time. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. Include the \\`EndTime\\` parameter to display the performance data until the specified end time. If \\`EndTime\\`is not specified, the end time will default to the current time. If the \\`Resolution\\` parameter is not specified but either the \\`StartTime\\` or \\`EndTime\\` parameter is, then \\`Resolution\\` will default to the lowest valid resolution. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
| <nobr>StartTime</nobr> | none | Displays historical performance data for the specified time window, where \\`StartTime\\` is the beginning of the time window, and \\`EndTime\\` is the end of the time window. The \\`StartTime\\` and \\`EndTime\\` parameters are specified in milliseconds since the UNIX epoch. If \\`StartTime\\` is not specified, the start time will default to one resolution before the end time, meaning that the most recent sample of performance data will be displayed. If \\`EndTime\\`is not specified, the end time will default to the current time. Include the \\`Resolution\\` parameter to display the performance data at the specified resolution. If not specified, \\`Resolution\\` defaults to the lowest valid resolution. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeSpace -Array $Array -Name $Volume.Name
```
Get volume space statistics on FlashArray

## Get-Pfa2VolumeTag
### Synopsis
List tags
### Syntax
```powershell

Get-Pfa2VolumeTag [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-Limit <Int32>] [-Offset <Int32>] [-ResourceDestroyed <Boolean>] [-ResourceIds <System.Collections.Generic.List`1[System.String]>] [-ResourceNames <System.Collections.Generic.List`1[System.String]>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>ResourceDestroyed</nobr> | none | If set to \\`true\\`, returns only objects from destroyed resources. Returns an error if the name of a live resource is specified in the \\`ResourceNames\\` query parameter. If set to \\`false\\`, returns only objects from live resources. Returns an error if the name of a destroyed resource is specified in the \\`ResourceNames\\` query parameter. | false | False | None |
| <nobr>ResourceIds</nobr> | none | A list of resource IDs. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>ResourceNames</nobr> | none | A list of resource names. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeTag -Array $Array -ResourceNames $Volume.Name
```
Get all tags on volume $Volume.Name on FlashArray

## Get-Pfa2VolumeVolumeGroup
### Synopsis
List volumes that are in volume groups
### Syntax
```powershell

Get-Pfa2VolumeVolumeGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Filter <String>] [-GroupIds <System.Collections.Generic.List`1[System.String]>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-Limit <Int32>] [-MemberIds <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-Offset <Int32>] [-Sort <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Filter</nobr> | none | Narrows down the results to only the response objects that satisfy the filter criteria. | false | False | None |
| <nobr>GroupIds</nobr> | none | A list of group IDs. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>Limit</nobr> | none | Limits the size of the response to the specified number of objects on each page. To return the total number of resources, set \\`limit=0\\`. The total number of resources is returned as a \\`TotalItemCount\\` value. If the page size requested is larger than the system maximum limit, the server returns the maximum limit, disregarding the requested page size. | false | False | None |
| <nobr>MemberIds</nobr> | none | A list of member IDs. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>Offset</nobr> | none | The starting position based on the results of the query in relation to the full set of response objects returned. | false | False | None |
| <nobr>Sort</nobr> | none | Returns the response objects in the order specified. Set \\`Sort\\` to the name in the response by which to sort. Sorting can be performed on any of the names in the response, and the objects can be sorted in ascending or descending order. By default, the response objects are sorted in ascending order. To sort in descending order, append the minus sign \\(\\`-\\`\) to the name. A single request can be sorted on multiple objects. For example, you can sort all volumes from largest to smallest volume size, and then sort volumes of the same size in ascending order by volume name. To sort on multiple names, list the names as comma-separated values. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Get-Pfa2VolumeVolumeGroup -Array $Array -MemberIds $Volume.Id
```
Find VolumeGroups where a volume of which the id is $Volume.Id belongs.

## Invoke-Pfa2CLICommand
### Synopsis
Execute CLI Command on the FlashArray
### Syntax
```powershell

Invoke-Pfa2CLICommand -CommandText <String> -Credential <PSCredential> -EndPoint <String> [-IgnoreCertificateError] [-TimeOutInMilliSeconds <Int32>] [<CommonParameters>]

Invoke-Pfa2CLICommand -CommandText <String> -EndPoint <String> [-IgnoreCertificateError] -Password <SecureString> [-TimeOutInMilliSeconds <Int32>] -UserName <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>CommandText</nobr> | none | The CLI command to run on the FlashArray | true | False | None |
| <nobr>Credential</nobr> | none | The credentials for SSH access to the FlashArray | true | True \\(ByValue\) | None |
| <nobr>EndPoint</nobr> | none | The management address of the FlashArray | true | True \\(ByPropertyName\) | None |
| <nobr>IgnoreCertificateError</nobr> | none | Prevents certificate errors such as an unknown certificate issuer or non-matching names from causing the request to fail. | false | False | False |
| <nobr>Password</nobr> | none | The SSH password for the FlashArray | true | False | None |
| <nobr>TimeOutInMilliSeconds</nobr> | none | Timeout in milliseconds | false | False | None |
| <nobr>UserName</nobr> | none | The SSH username for the FlashArray | true | False | None |
### Inputs
 - System.String   System.Management.Automation.PSCredential

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Invoke-Pfa2CLICommand -EndPoint $ArrayEndpoint -Username $ArrayUsername -Password $Password -CommandText $CommandText
```
Run a SSH cli command on FlashArray using Invoke-Pfa2CLICommand

## New-Pfa2Admin
### Synopsis
Create an administrator
### Syntax
```powershell

New-Pfa2Admin [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [-Password <String>] [-RoleName <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Password</nobr> | none | Password associated with the account. | false | False | None |
| <nobr>RoleName</nobr> | none | Privilege level. Valid values include \\`array\\_admin\\`, \\`storage\\_admin\\`, and \\`readonly\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Admin -Array $Array -Name $Name -Password $ArrayPassword -Role "array_admin"
```
Create a new array administrator on FlashArray with name $Name and password $ArrayPassword

## New-Pfa2AdminApiToken
### Synopsis
Create API tokens
### Syntax
```powershell

New-Pfa2AdminApiToken [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [-Timeout <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Timeout</nobr> | none | The duration of API token validity, in milliseconds. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2AdminApiToken -Array $Array -Name $ArrayUsername
```
Create a new admin API token on FlashArray for admin name $ArrayUsername, call fails if API token already exists

**Example 2**
```powershell
New-Pfa2AdminApiToken -Array $Array -Name $Name -Timeout 1000
```
Create a new API token for array admin $Name with timeout of 1000 seconds

## New-Pfa2AdminRoleObject
### Synopsis
Create an object of type AdminRole
### Syntax
```powershell

New-Pfa2AdminRoleObject [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Name</nobr> | none | The resource name, such as volume name, pod name, snapshot name, and so on. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2ApiClient
### Synopsis
Create an API client
### Syntax
```powershell

New-Pfa2ApiClient [-AccessTokenTtlInMs <Int64>] [-ApiVersion <String>] [-Array <Rest2Api>] [-Issuer <String>] [-MaxRole <String>] [-Name <String>] [-PublicKey <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AccessTokenTtlInMs</nobr> | none | The TTL \\(Time To Live\) length of time for the exchanged access token. Measured in milliseconds. If not specified, defaults to \\`86400000\\`. | false | False | None |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Issuer</nobr> | none | The name of the identity provider that will be issuing ID Tokens for this API client. The \\`iss\\` claim in the JWT issued must match this string. If not specified, defaults to the API client name. | false | False | None |
| <nobr>MaxRole</nobr> | none | The maximum role allowed for ID Tokens issued by this API client. The bearer of an access token will be authorized to perform actions within the intersection of this \\`max\\_role\\` and the role of the array user specified as the \\`sub\\`. Valid values are \\`array\\_admin\\`, \\`storage\\_admin\\`, \\`ops\\_admin\\`, and \\`readonly\\`. Users with the \\`readonly\\` \\(Read Only\) role can perform operations that convey the state of the array. Read Only users cannot alter the state of the array. Users with the \\`ops\\_admin\\` \\(Ops Admin\) role can perform the same operations as Read Only users plus enable and disable remote assistance sessions. Ops Admin users cannot alter the state of the array. Users with the \\`storage\\_admin\\` \\(Storage Admin\) role can perform the same operations as Read Only users plus storage related operations, such as administering volumes, hosts, and host groups. Storage Admin users cannot perform operations that deal with global and system configurations. Users with the \\`array\\_admin\\` \\(Array Admin\) role can perform the same operations as Storage Admin users plus array-wide changes dealing with global and system configurations. In other words, Array Admin users can perform all operations. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>PublicKey</nobr> | none | The API client's PEM formatted \\(Base64 encoded\) RSA public key. Include the \\`-----BEGIN PUBLIC KEY-----\\` and \\`-----END PUBLIC KEY-----\\` lines. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ApiClient -Array $Array -MaxRole $MaxRole -Issuer $Issuer -PublicKey $Certificate -Name $ClientName
```
Create API client on FlashArray with maxrole as "array\\_admin" and name as $ClientName

## New-Pfa2ArrayAuth
### Synopsis
Create an API Client
### Syntax
```powershell

New-Pfa2ArrayAuth [-AccessTokenTtlMilliSeconds <Int64>] -ApiClientName <String> -Credential <PSCredential> -Endpoint <String> [-Force] -Issuer <String> [-MaxRole <String>] [<CommonParameters>]

New-Pfa2ArrayAuth [-AccessTokenTtlMilliSeconds <Int64>] -ApiClientName <String> -Endpoint <String> [-Force] -Issuer <String> [-MaxRole <String>] -Password <SecureString> -Username <String> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AccessTokenTtlMilliSeconds</nobr> | none | Access token time-to-live duration, in milliseconds. | false | False | None |
| <nobr>ApiClientName</nobr> | none | A user-specified name. The name must be locally unique and cannot be changed. | true | False | None |
| <nobr>Credential</nobr> | none | The credentials for the FlashArray login. | true | True \\(ByValue\) | None |
| <nobr>Endpoint</nobr> | none | The FlashArray name or IP address. | true | False | None |
| <nobr>Force</nobr> | none | Overwrites an existing ApiClient on the FlashArray if certificates are not found on the local machine. | false | False | False |
| <nobr>Issuer</nobr> | none | The name of the identity provider that will be issuing ID Tokens for this API client. This string represents the JWT iss \\(issuer\) claim in ID Tokens issued for this API client. | true | False | None |
| <nobr>MaxRole</nobr> | none | The maximum role allowed for ID Tokens issued by this API client. The bearer of an access token will be authorized to perform actions within the intersection of this max\\_role and the role of the array user specified as the JWT sub \\(subject\) claim. Valid max\\_role values are readonly, ops\\_admin, array\\_admin, and storage\\_admin. Users with the readonly \\(Read Only\) role can perform operations that convey the state of the array. Read Only users cannot alter the state of the array. Users with the ops\\_admin \\(Ops Admin\) role can perform the same operations as Read Only users plus enable and disable remote assistance sessions. Ops Admin users cannot alter the state of the array. Users with the storage\\_admin \\(Storage Admin\) role can perform the same operations as Read Only users plus storage related operations, such as administering volumes, hosts, and host groups. Storage Admin users cannot perform operations that deal with global and system configurations. Users with the array\\_admin \\(Array Admin\) role can perform the same operations as Storage Admin users plus array-wide changes dealing with global and system configurations. In other words, Array Admin users can perform all operations. | false | False | None |
| <nobr>Password</nobr> | none | Password associated with the login name of the array user. | true | False | None |
| <nobr>Username</nobr> | none | Login name of the array user for whom the token should be issued. This must be a valid user in the system. | true | False | None |
### Inputs
 - System.Management.Automation.PSCredential

### Outputs
 - PureStorage.Rest.PureApiClientAuthInfo

### Examples
**Example 1**
```powershell
New-Pfa2ArrayAuth -Endpoint $endpoint -ApiClientName $clientName -Issuer $issuer -Username $arrayUsername -Password $psw
```
Create a new API client on FlashArray. The $ClientName must be unique per API client.

## New-Pfa2ChapObject
### Synopsis
Create an object of type Chap
### Syntax
```powershell

New-Pfa2ChapObject [-HostPassword <String>] [-HostUser <String>] [-TargetPassword <String>] [-TargetUser <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>HostPassword</nobr> | none | The host password for CHAP authentication. The password must be between 12 and 255 characters \\(inclusive\) and cannot be the same as the target password. | false | False | None |
| <nobr>HostUser</nobr> | none | The host username for CHAP authentication. | false | False | None |
| <nobr>TargetPassword</nobr> | none | The target password for CHAP authentication. The password must be between 12 and 255 characters \\(inclusive\) and cannot be the same as the host password. | false | False | None |
| <nobr>TargetUser</nobr> | none | The target username for CHAP authentication. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ChapObject -HostPassword "$(GetGuidName)" -HostUser $chapName -TargetPassword "$(GetGuidName)" -TargetUser $chapName
```
Create a new Chap object with parameters of HostPassword, HostUser, TargetPassword, and TargetUser, Chap object could be used as a parameter of New-Pfa2Host

## New-Pfa2Connection
### Synopsis
Create a connection between a volume and host or host group
### Syntax
```powershell

New-Pfa2Connection [-ApiVersion <String>] [-Array <Rest2Api>] [-HostGroupNames <System.Collections.Generic.List`1[System.String]>] [-HostNames <System.Collections.Generic.List`1[System.String]>] [-Lun <Int32>] [-ProtocolEndpoint <Reference>] [-VolumeNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>HostGroupNames</nobr> | none | Performs the operation on the host group specified. Enter multiple names in comma-separated format. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple host group names and volume names; instead, at least one of the objects \\(e.g., \\`HostGroupNames\\`\) must be set to only one name \\(e.g., \\`hgroup01\\`\). | false | False | None |
| <nobr>HostNames</nobr> | none | Performs the operation on the hosts specified. Enter multiple names in comma-separated format. For example, \\`host01,host02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple host names and volume names; instead, at least one of the objects \\(e.g., \\`HostNames\\`\) must be set to only one name \\(e.g., \\`host01\\`\). | false | False | None |
| <nobr>Lun</nobr> | none | The logical unit number \\(LUN\) by which the specified hosts are to address the specified volume. If the LUN is not specified, the system automatically assigns a LUN to the connection. To automatically assign a LUN to a private connection, the system starts at LUN \\`1\\` and counts up to the maximum LUN \\`4095\\`, assigning the first available LUN to the connection. For shared connections, the system starts at LUN \\`254\\` and counts down to the minimum LUN \\`1\\`, assigning the first available LUN to the connection. If all LUNs in the \\`\\[1...254\\]\\` range are taken, the system starts at LUN \\`255\\` and counts up to the maximum LUN \\`4095\\`, assigning the first available LUN to the connection. | false | False | None |
| <nobr>ProtocolEndpoint</nobr> | none | A protocol endpoint \\(also known as a conglomerate volume\) which acts as a proxy through which virtual volumes are created and then connected to VMware ESXi hosts or host groups. The protocol endpoint itself does not serve I/Os; instead, its job is to form connections between FlashArray volumes and ESXi hosts and host groups. | false | False | None |
| <nobr>VolumeNames</nobr> | none | Performs the operation on the volume specified. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple volume names and host names; instead, at least one of the objects \\(e.g., \\`VolumeNames\\`\) must be set to only one name \\(e.g., \\`vol01\\`\). | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Connection -Array $Array -HostNames $Host_.Name -VolumeNames $Volume.Name
```
Create a connection between volume $Volume.Name and host $Host\\_.Name

**Example 2**
```powershell
New-Pfa2Connection -Array $Array -HostGroupNames $HostGroup.Name -VolumeNames $Volume.Name
```
Create a connection between volume $Volume.Name and host group $HostGroup.Name

## New-Pfa2EulaSignatureObject
### Synopsis
Create an object of type EulaSignature
### Syntax
```powershell

New-Pfa2EulaSignatureObject [-Accepted <Int64>] [-Company <String>] [-Name <String>] [-Title <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Accepted</nobr> | none | Accepted time in milliseconds since the UNIX epoch. | false | False | None |
| <nobr>Company</nobr> | none | Company of the person who accepted the End User Agreement. | false | False | None |
| <nobr>Name</nobr> | none | Name of the person who accepted the End User Agreement. | false | False | None |
| <nobr>Title</nobr> | none | Title of the person who accepted the End User Agreement. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2EulaSignatureObject -Name $SignatureName -Title $SignatureTitle -Company $SignatureCompany
```
Create a Eula Signature object with values of Name, Title, and Company. Eula signature could be used for Update-Pfa2ArrayEula cmdlet

## New-Pfa2FixedReferenceObject
### Synopsis
Create an object of type FixedReference
### Syntax
```powershell

New-Pfa2FixedReferenceObject [-Id <String>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Id</nobr> | none | A globally unique, system-generated ID. The ID cannot be modified. | false | False | None |
| <nobr>Name</nobr> | none | The resource name, such as volume name, pod name, snapshot name, and so on. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2FixedReferenceObject -Id "TestResourceId" -Name "TestResourceName"
```
Create a new FixedReference object with parameter of Id and name, FixedReference object could be used as a parameter of New-Pfa2TagObject

## New-Pfa2Host
### Synopsis
Create a host
### Syntax
```powershell

New-Pfa2Host [-ApiVersion <String>] [-Array <Rest2Api>] [-Chap <Chap>] [-Iqns <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-Nqns <System.Collections.Generic.List`1[System.String]>] [-Personality <String>] [-PreferredArrays <System.Collections.Generic.List`1[PureStorage.FlashArray.Rest.Model.Reference]>] [-Wwns <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Chap</nobr> | none | Challenge-Handshake Authentication Protocol \\(CHAP\). | false | False | None |
| <nobr>Iqns</nobr> | none | The iSCSI qualified name \\(IQN\) associated with the host. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Nqns</nobr> | none | The NVMe Qualified Name \\(NQN\) associated with the host. | false | False | None |
| <nobr>Personality</nobr> | none | Determines how the system tunes the array to ensure that it works optimally with the host. Set \\`personality\\` to the name of the host operating system or virtual memory system. Valid values are \\`aix\\`, \\`esxi\\`, \\`hitachi-vsp\\`, \\`hpux\\`, \\`oracle-vm-server\\`, \\`solaris\\`, and \\`vms\\`. If your system is not listed as one of the valid host personalities, do not set the option. By default, the personality is not set. | false | False | None |
| <nobr>PreferredArrays</nobr> | none | For synchronous replication configurations, sets a host's preferred array to specify which array exposes active/optimized paths to that host. Enter multiple preferred arrays in comma-separated format. If a preferred array is set for a host, then the other arrays in the same pod will expose active/non-optimized paths to that host. If the host is in a host group, \\`preferred\\_arrays\\` cannot be set because host groups have their own preferred arrays. On a preferred array of a certain host, all the paths on all the ports \\(for both the primary and secondary controllers\) are set up as A/O \\(active/optimized\) paths, while on a non-preferred array, all the paths are A/N \\(Active/Non-optimized\) paths. | false | False | None |
| <nobr>Wwns</nobr> | none | The Fibre Channel World Wide Name \\(WWN\) associated with the host. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Host -Array $Array -Name "$(GetGuidName)"
```
Create a new host on FlashArray with name "$\\(GetGuidName\)"

**Example 2**
```powershell
New-Pfa2Host -Array $Array -Name $HostName -iqns $iqns -nqns $nqns -wwns $wwns -chap $chap
```
Create a new host with parameters of Name, iqns, nqns, wwns, and chap. Chap object can be created with New-Pfa2ChapObject cmdlet.

## New-Pfa2HostGroup
### Synopsis
Create a host group
### Syntax
```powershell

New-Pfa2HostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2HostGroup -Array $Array -Name "$(GetGuidName)"
```
Create a new host group with a name "$\\(GetGuidName\)"

## New-Pfa2HostGroupHost
### Synopsis
Add a host to a host group
### Syntax
```powershell

New-Pfa2HostGroupHost [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2HostGroupHost -Array $Array -GroupNames $HostGroup.Name -MemberNames $Host_.Name
```
Add a host $Host\\_.Name to hostGroup $HostGroup.Name

## New-Pfa2HostGroupProtectionGroup
### Synopsis
Create a host group
### Syntax
```powershell

New-Pfa2HostGroupProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2HostGroupProtectionGroup -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHostGroup.Name
```
Add host group $NewHostGroup.Name to protection group $ProtectionGroupName

## New-Pfa2HostHostGroup
### Synopsis
Add a host to a host group
### Syntax
```powershell

New-Pfa2HostHostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2HostHostGroup -Array $Array -GroupNames  $HostGroupName -MemberNames $NewHost.Name
```
Add host $NewHost.Name to host group $HostGroupName

## New-Pfa2HostProtectionGroup
### Synopsis
Create a host
### Syntax
```powershell

New-Pfa2HostProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2HostProtectionGroup -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHost.Name
```
Add host $NewHost.Name to protection group $ProtectionGroupName

## New-Pfa2Kmip
### Synopsis
Create KMIP server object
### Syntax
```powershell

New-Pfa2Kmip [-ApiVersion <String>] [-Array <Rest2Api>] [-CaCertificate <String>] [-CertificateName <String>] [-Name <String>] [-Uris <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>CaCertificate</nobr> | none | The text of the CA certificate for the KMIP server. | false | False | None |
| <nobr>CertificateName</nobr> | none | The certificate used to verify FlashArray authenticity to the KMIP servers. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Uris</nobr> | none | List of URIs for the configured KMIP servers. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Kmip -Array $Array -Name $kmipName -Uri $hostName -Certificate $certName -CaCertificate $format_wildcard_dev_purestorage_com_ca_bundle
```
Create a Kmip server by setting values of name, certificate, and CaCertificate

## New-Pfa2Login
### Synopsis
POST login \\(placeholder\)
### Syntax
```powershell

New-Pfa2Login [-ApiToken <String>] [-ApiVersion <String>] [-Array <Rest2Api>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiToken</nobr> | none | API token for a user. | false | False | None |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2Logout
### Synopsis
POST logout \\(placeholder\)
### Syntax
```powershell

New-Pfa2Logout [-ApiVersion <String>] [-Array <Rest2Api>] [-XAuthToken <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>XAuthToken</nobr> | none | Session token for a user. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2MaintenanceWindow
### Synopsis
Create a maintenance window
### Syntax
```powershell

New-Pfa2MaintenanceWindow [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [-Timeout <Int32>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Timeout</nobr> | none | The specified length of time that alerts are suppressed during a maintenance window, measured in milliseconds. The maintenance window timeout value must be between \\`60000\\` \\(1 minute\) and \\`86400000\\` \\(24 hours\). The value entered is rounded down to the nearest minute. The \\`names\\` and \\`timeout\\` parameters must be set together, and the \\`names\\` parameter must be set to \\`environment\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2MaintenanceWindow -Array $Array  -Name "environment" -Time 3600000
```
Create a maintenance window named "environment" and set time as 3600000 milliseconds

## New-Pfa2Offload
### Synopsis
Create offload target
### Syntax
```powershell

New-Pfa2Offload [-AmazonS3 <OffloadAmazons3>] [-ApiVersion <String>] [-Array <Rest2Api>] [-Azure <OffloadAzure>] [-GoogleCloud <OffloadGoogleCloud>] [-Initialize <Boolean>] [-Name <String>] [-Nfs <OffloadNfs>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AmazonS3</nobr> | none | S3 settings. | false | False | None |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Azure</nobr> | none | Microsoft Azure Blob storage settings. | false | False | None |
| <nobr>GoogleCloud</nobr> | none | Google Cloud Storage settings. | false | False | None |
| <nobr>Initialize</nobr> | none | If set to \\`true\\`, initializes the Amazon S3/Azure Blob container/Google Cloud Storage in preparation for offloading. The parameter must be set to \\`true\\` if this is the first time the array is connecting to the offload target. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Nfs</nobr> | none | NFS settings. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Offload -Array $Array -Nfs $nfs -Name $NFSTargetName
```
Create a new offload target specified by object $nfs \\(See New-Pfa2OffloadNfsObject for details\) and name $NFSTargetName

## New-Pfa2OffloadAmazons3Object
### Synopsis
Create an object of type OffloadAmazons3
### Syntax
```powershell

New-Pfa2OffloadAmazons3Object [-AccessKeyId <String>] [-Bucket <String>] [-PlacementStrategy <String>] [-SecretAccessKey <String>] [-Uri <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AccessKeyId</nobr> | none | The access key ID of the AWS account used to create a connection between the array and an Amazon S3 offload target. The access key ID is 20 characters in length and is only accepted when creating the connection between the array and the S3 offload target. The \\`AccessKeyId\\`, \\`SecretAccessKey\\`, and \\`Bucket\\` parameters must be set together. | false | False | None |
| <nobr>Bucket</nobr> | none | The name of the Amazon S3 bucket to where the data will be offloaded. Grant basic read and write ACL permissions to the bucket, and enable default \\(server-side\) encryption for the bucket. Also verify that the bucket is empty of all objects and does not have any lifecycle policies. The \\`AccessKeyId\\`, \\`SecretAccessKey\\`, and \\`Bucket\\` parameters must be set together. | false | False | None |
| <nobr>PlacementStrategy</nobr> | none | The storage placement strategy used for the dynamic placement of data in an Amazon S3 offload target. Valid values are \\`aws-intelligent-tiering\\`, \\`aws-standard-class\\`, and \\`retention-based\\`. If set to \\`aws-intelligent-tiering\\`, data is stored in the Amazon S3 INTELLIGENT\\_TIERING storage class regardless of the retention period. If set to \\`aws-standard-access\\`, the data is stored in the Amazon S3 STANDARD storage class regardless of the retention period. If set to \\`retention-based\\`, the data for protection groups with longer retention periods is placed in the Amazon S3 STANDARD\\_IA \\(infrequently accessed, more cost-effective\) storage class. All other data is placed in the STANDARD storage class. When the array is initially connected to an S3 offload target, \\`PlacementStrategy\\` is automatically set to \\`retention-based\\`. The \\`PlacementStrategy\\` and \\`Uri\\` parameters cannot be set together. | false | False | None |
| <nobr>SecretAccessKey</nobr> | none | The secret access key that goes with the access key ID \\(\\`AccessKeyId\\`\) of the AWS account. The secret access key is 40 characters in length is only accepted when creating the connection between the array and the S3 offload target. The \\`AccessKeyId\\`, \\`SecretAccessKey\\`, and \\`Bucket\\` parameters must be set together. | false | False | None |
| <nobr>Uri</nobr> | none | The URI used to create a connection between the array and a non-S3 offload target. Storage placement strategies are not supported for non-S3 offload targets. Both the HTTP and HTTPS protocols are allowed. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2OffloadAzureObject
### Synopsis
Create an object of type OffloadAzure
### Syntax
```powershell

New-Pfa2OffloadAzureObject [-AccountName <String>] [-ContainerName <String>] [-SecretAccessKey <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AccountName</nobr> | none | The name of the existing Azure Blob storage account. | false | False | None |
| <nobr>ContainerName</nobr> | none | The name of the container in the Azure Blob storage account to where the data will be offloaded. The name must be a valid DNS name. If not specified, defaults to \\`offload\\`. | false | False | None |
| <nobr>SecretAccessKey</nobr> | none | The secret access key that goes with the account name \\(\\`AccountName\\`\) of the Azure Blob storage account. The secret access key is only accepted when creating the connection between the array and the Azure Blob storage account. The \\`AccountName\\` and \\`ContainerName\\`, and \\`SecretAccessKey\\` parameters must be set together. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2OffloadGoogleCloudObject
### Synopsis
Create an object of type OffloadGoogleCloud
### Syntax
```powershell

New-Pfa2OffloadGoogleCloudObject [-AccessKeyId <String>] [-Bucket <String>] [-SecretAccessKey <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AccessKeyId</nobr> | none | The access key ID of the Google Cloud account used to create a connection between the array and a Google Cloud offload target. The access key ID is 24 characters in length and is only accepted when creating the connection between the array and the Google Cloud offload target. The \\`AccessKeyId\\`, \\`SecretAccessKey\\`, and \\`Bucket\\` parameters must be set together. | false | False | None |
| <nobr>Bucket</nobr> | none | The name of the Google Cloud Storage bucket to which the data will be offloaded. Grant basic read and write access permissions to the bucket and verify that the bucket is empty of all objects. The \\`AccessKeyId\\`, \\`SecretAccessKey\\`, and \\`Bucket\\` parameters must be set together. | false | False | None |
| <nobr>SecretAccessKey</nobr> | none | The secret access key that goes with the access key ID of the Google Cloud account. The secret access key is 40 characters in length is only accepted when creating the connection between the array and the Google Cloud offload target. The \\`AccessKeyId\\`, \\`SecretAccessKey\\`, and \\`Bucket\\` parameters must be set together. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2OffloadNfsObject
### Synopsis
Create an object of type OffloadNfs
### Syntax
```powershell

New-Pfa2OffloadNfsObject [-Address <String>] [-MountOptions <String>] [-MountPoint <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Address</nobr> | none | The hostname or IP address of the NFS server to where the data will be offloaded. An array can be connected to one offload target at a time, while multiple arrays can be connected to the same offload target. If the protection group is in a stretched pod, for high availability, connect both arrays in the stretched pod to the offload target. | false | False | None |
| <nobr>MountOptions</nobr> | none | The custom mount options on the NFS server. Enter multiple mount options in comma-separated format. Valid values include \\`port\\`, \\`rsize\\`, \\`wsize\\`, \\`nfsvers\\`, and \\`tcp\\` or \\`udp\\`. These mount options are common to all NFS file systems. | false | False | None |
| <nobr>MountPoint</nobr> | none | The mount point of the NFS export on the NFS server. For example, \\`/mnt\\`. The \\`access\\_key\\_id\\`, \\`secret\\_access\\_key\\`, and \\`bucket\\` parameters must be set together. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2OffloadNfsObject -Address '10.15.87.42' -MountOptions 'rsize=4096,wsize=4096' -MountPoint '/mnt/exports/share1'
```
Create a new Nfs offload object with address of '10.15.87.42', MountOptions of 'rsize=4096,wsize=4096', and MountPoint of '/mnt/exports/share1'

## New-Pfa2Pod
### Synopsis
Create a pod
### Syntax
```powershell

New-Pfa2Pod [-ApiVersion <String>] [-Array <Rest2Api>] [-FailoverPreferences <System.Collections.Generic.List`1[PureStorage.FlashArray.Rest.Model.Reference]>] [-Name <String>] [-Source <Reference>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>FailoverPreferences</nobr> | none | Determines which array within a stretched pod should be given priority to stay online should the arrays ever lose contact with each other. The current array and any peer arrays that are connected to the current array for synchronous replication can be added to a pod for failover preference. By default, \\`failover\\_preferences=null\\`, meaning no arrays have been configured for failover preference. Enter multiple arrays in comma-separated format. To clear the list of failover preferences, set to an empty list \\`\\[\\]\\`. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Source</nobr> | none | The source pod from where data is cloned to create the new pod. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Pod -Array $TargetArray -Name $RemotePodName
```
Create a POD on the FlashArray with $RemotePodName

## New-Pfa2PodArray
### Synopsis
Stretch a pod to an array
### Syntax
```powershell

New-Pfa2PodArray [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupIds <System.Collections.Generic.List`1[System.String]>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberIds <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupIds</nobr> | none | A list of group IDs. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberIds</nobr> | none | A list of member IDs. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2PodReplicaLink
### Synopsis
Create pod replica links
### Syntax
```powershell

New-Pfa2PodReplicaLink [-ApiVersion <String>] [-Array <Rest2Api>] [-LocalPodIds <System.Collections.Generic.List`1[System.String]>] [-LocalPodNames <System.Collections.Generic.List`1[System.String]>] [-RemoteIds <System.Collections.Generic.List`1[System.String]>] [-RemoteNames <System.Collections.Generic.List`1[System.String]>] [-RemotePodIds <System.Collections.Generic.List`1[System.String]>] [-RemotePodNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>LocalPodIds</nobr> | none | A list of local pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodNames\\` query parameter. | false | False | None |
| <nobr>LocalPodNames</nobr> | none | A list of local pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodIds\\` query parameter. | false | False | None |
| <nobr>RemoteIds</nobr> | none | A list of remote array IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteNames\\` query parameter. | false | False | None |
| <nobr>RemoteNames</nobr> | none | A list of remote array names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteIds\\` query parameter. | false | False | None |
| <nobr>RemotePodIds</nobr> | none | A list of remote pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodNames\\` query parameter. | false | False | None |
| <nobr>RemotePodNames</nobr> | none | A list of remote pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodIds\\` query parameter. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2PodReplicaLink -Array $Array -LocalPodNames $LocalPodName -RemoteNames $TargetEndPoint -RemotePodNames $RemotePodName
```
Create a POD replica link with local pod names $LocalPodName, remote pod names $RemotePodName and remote FlashArray name $TargetEndPoint

## New-Pfa2ProtectionGroup
### Synopsis
Create a protection group
### Syntax
```powershell

New-Pfa2ProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [-Overwrite <Boolean>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Overwrite</nobr> | none | If set to \\`true\\`, overwrites an existing volume during a volume copy operation. If set to \\`false\\` or not set at all and the target name is an existing volume, the volume copy operation fails. Required if the \\`source: id\\` or \\`source: name\\` body parameter is set and the source overwrites an existing volume during the volume copy operation. | false | False | None |
| <nobr>SourceNames</nobr> | none | The name of the protection group or protection group snapshot to be copied into a new or existing protection group. If the destination protection group and all of its volumes already exist, include the \\`Overwrite\\` parameter to overwrite all of the existing volumes with the snapshot contents. If including the \\`Overwrite\\` parameter, the names of the volumes that are being overwritten must match the names of the volumes that are being restored. If the source is a protection group, the latest snapshot of the protection group will be used as the source during the copy operation. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ProtectionGroup -Array $Array -Name $ProtectionGroupName
```
Create a protection group on FlashArray with name $ProtectionGroupName

## New-Pfa2ProtectionGroupHost
### Synopsis
Add a host to a protection group
### Syntax
```powershell

New-Pfa2ProtectionGroupHost [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ProtectionGroupHost -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHost.Name
```
Add a host $NewHost.Name to protection group $ProtectionGroupName

## New-Pfa2ProtectionGroupHostGroup
### Synopsis
Add a host group to a protection group
### Syntax
```powershell

New-Pfa2ProtectionGroupHostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ProtectionGroupHostGroup -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHostGroup.Name
```
Add a host group $NewHostGroup.Name to protection group $ProtectionGroupName

## New-Pfa2ProtectionGroupSnapshot
### Synopsis
Create a protection group snapshot
### Syntax
```powershell

New-Pfa2ProtectionGroupSnapshot [-ApiVersion <String>] [-ApplyRetention <Boolean>] [-Array <Rest2Api>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [-Suffix <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>ApplyRetention</nobr> | none | If \\`true\\`, applies the local and remote retention policy to the snapshots. | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
| <nobr>Suffix</nobr> | none | The name suffix appended to the protection group name to make up the full protection group snapshot name in the form \\`PGROUP.SUFFIX\\`. If \\`suffix\\` is not specified, the protection group name is in the form \\`PGROUP.NNN\\`, where \\`NNN\\` is a unique monotonically increasing number. If multiple protection group snapshots are created at a time, the suffix name is appended to those snapshots. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ProtectionGroupSnapshot -Array $Array -SourceNames $ProtectionGroupName
```
Create a new protection group snapshot for group $ProtectionGroupName on FlashArray

## New-Pfa2ProtectionGroupTarget
### Synopsis
Add a target to a protection group
### Syntax
```powershell

New-Pfa2ProtectionGroupTarget [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ProtectionGroupTarget -Array $Array -GroupNames $ProtectionGroupName -MemberNames $NFSTargetName
```
Add a target $NFSTargetName to protection group $ProtectionGroupName

## New-Pfa2ProtectionGroupVolume
### Synopsis
Add a volume to a protection group
### Syntax
```powershell

New-Pfa2ProtectionGroupVolume [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ProtectionGroupVolume -Array $Array -GroupNames $ProtectionGroupName -MemberNames $VolumeName
```
Add a volume $VolumeName to protection group $ProtectionGroupName

## New-Pfa2QosObject
### Synopsis
Create an object of type Qos
### Syntax
```powershell

New-Pfa2QosObject [-BandwidthLimit <Int64>] [-IopsLimit <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>BandwidthLimit</nobr> | none | The maximum QoS bandwidth limit for the volume. Whenever throughput exceeds the bandwidth limit, throttling occurs. Measured in bytes per second. Maximum limit is 512 GB/s. | false | False | None |
| <nobr>IopsLimit</nobr> | none | The QoS IOPs limit for the volume. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2QosObject -BandwidthLimit 1048576 -IopsLimit 100
```
Create a new Qos object with values of BandwidthLimit and IopsLimit. The Qos object could be used for Update-Pfa2VolumeGroup or New-Pfa2VolumeGroup

## New-Pfa2ReferenceNoIdObject
### Synopsis
Create an object of type ReferenceNoId
### Syntax
```powershell

New-Pfa2ReferenceNoIdObject [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Name</nobr> | none | The resource name, such as volume name, pod name, snapshot name, and so on. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2ReferenceObject
### Synopsis
Create an object of type Reference
### Syntax
```powershell

New-Pfa2ReferenceObject [-Id <String>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Id</nobr> | none | A globally unique, system-generated ID. The ID cannot be modified. | false | False | None |
| <nobr>Name</nobr> | none | The resource name, such as volume name, pod name, snapshot name, and so on. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2ReferenceObject -Name $VolumeGroup.Name
```
Create a new reference object with a name. The reference object could be used for Update-Pfa2Volume

## New-Pfa2ReplicationScheduleObject
### Synopsis
Create an object of type ReplicationSchedule
### Syntax
```powershell

New-Pfa2ReplicationScheduleObject [-Blackout <TimeWindow>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Blackout</nobr> | none | The range of time when to suspend replication. To clear the blackout period, set to an empty string \\(""\). | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2RetentionPolicyObject
### Synopsis
Create an object of type RetentionPolicy
### Syntax
```powershell

New-Pfa2RetentionPolicyObject [-AllForSec <Int32>] [-Days <Int32>] [-PerDay <Int32>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AllForSec</nobr> | none | The length of time to keep the specified snapshots. Measured in seconds. | false | False | None |
| <nobr>Days</nobr> | none | The number of days to keep the snapshots after the \\`AllForSec\\` period has passed. | false | False | None |
| <nobr>PerDay</nobr> | none | The number of snapshots to keep per day after the \\`AllForSec\\` period has passed. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2RetentionPolicyObject -AllForSec 86400 -Days 7 -PerDay 3
```
Create a new retention policy object to update remote protection group retention policy \\(see Update-Pfa2RemoteProtectionGroup\)

## New-Pfa2SnapshotScheduleObject
### Synopsis
Create an object of type SnapshotSchedule
### Syntax
```powershell

New-Pfa2SnapshotScheduleObject [-At <Int64>] [-Enabled <Boolean>] [-Frequency <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>At</nobr> | none | The time of day the snapshot is scheduled to be taken and retained on the local array or immediately replicated to the target\\(s\). Measured in milliseconds since midnight. The \\`At\\` value is only used if the \\`Frequency\\` parameter is in days \\(e.g., \\`259200000\\`, which is equal to 3 days\). | false | False | None |
| <nobr>Enabled</nobr> | none | If set to \\`true\\`, the policy is enabled. | false | False | None |
| <nobr>Frequency</nobr> | none | The frequency of the scheduled action. Measured in milliseconds. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2Subnet
### Synopsis
Create subnet
### Syntax
```powershell

New-Pfa2Subnet [-ApiVersion <String>] [-Array <Rest2Api>] [-Enabled <Boolean>] [-Gateway <String>] [-Mtu <Int32>] -Name <String> [-Prefix <String>] [-Vlan <Int32>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Enabled</nobr> | none | Returns a value of \\`true\\` if subnet is enabled. Returns a value of \\`false\\` if subnet is disabled. If not specified, defaults to \\`true\\`. | false | False | None |
| <nobr>Gateway</nobr> | none | The IPv4 or IPv6 address of the gateway through which the specified subnet is to communicate with the network. | false | False | None |
| <nobr>Mtu</nobr> | none | Maximum message transfer unit \\(packet\) size for the subnet in bytes. MTU setting cannot exceed the MTU of the corresponding physical interface. If not specified, defaults to \\`1500\\`. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. For example, \\`name01\\`. Enter multiple names in comma-separated format. | true | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Prefix</nobr> | none | The IPv4 or IPv6 address to be associated with the specified subnet. | false | False | None |
| <nobr>Vlan</nobr> | none | VLAN ID number. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Subnet -Array $Array -Name $Name -Enabled $true -Gateway $Geteway -Mtu $Mtu -Prefix $Prefix -Vlan $Vlan
```
Create a new subnet with parameters of name, enabled, gateway, mtu, prefix, and vlan

## New-Pfa2TagObject
### Synopsis
Create an object of type Tag
### Syntax
```powershell

New-Pfa2TagObject [-Copyable <Boolean>] [-Key <String>] [-Namespace <String>] [-Resource <FixedReference>] [-Value <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Copyable</nobr> | none | Specifies whether or not to include the tag when copying the parent resource. If set to \\`true\\`, the tag is included in resource copying. If set to \\`false\\`, the tag is not included. If not specified, defaults to \\`true\\`. | false | False | None |
| <nobr>Key</nobr> | none | Key of the tag. Supports up to 64 Unicode characters. | false | False | None |
| <nobr>Namespace</nobr> | none | Optional namespace of the tag. Namespace identifies the category of the tag. Omitting the namespace defaults to the namespace \\`default\\`. The \\`pure&\#42;\\` namespaces are reserved for plugins and integration partners. It is recommended that customers avoid using reserved namespaces. | false | False | None |
| <nobr>Resource</nobr> | none | Tag resource | false | False | None |
| <nobr>Value</nobr> | none | Value of the tag. Supports up to 256 Unicode characters. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2TagObject -Copyable $True -Key "environment" -Namespace "default" -Value "staging" -Resource $ResourceRef
```
Create a tag object with fields Copyable, Key, Namespace, Value, and Resource \\(See Set-Pfa2VolumeTagBatch\). Resource parameter accepts type of FixedReference, which could be created from cmdlet New-Pfa2FixedReferenceObject

**Example 2**
```powershell
New-Pfa2TagObject -Copyable $True -Key $Key -Namespace "default" -Value $Value
```
Create a tag object with params Copyable, Key, Namesapce and Value \\(See Set-Pfa2VolumeSnapshotTagsBatch\)

## New-Pfa2TimeWindowObject
### Synopsis
Create an object of type TimeWindow
### Syntax
```powershell

New-Pfa2TimeWindowObject [-End <Int64>] [-Start <Int64>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>End</nobr> | none | The window end time. Measured in milliseconds since midnight. The time must be set on the hour. \\(e.g., \\`28800000\\`, which is equal to 8:00 AM\). | false | False | None |
| <nobr>Start</nobr> | none | The window start time. Measured in milliseconds since midnight. The time must be set on the hour. \\(e.g., \\`18000000\\`, which is equal to 5:00 AM\). | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## New-Pfa2Volume
### Synopsis
Create a volume
### Syntax
```powershell

New-Pfa2Volume [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Name <String>] [-Overwrite <Boolean>] [-Provisioned <Int64>] [-Qos <Qos>] [-Source <Reference>] [-Subtype <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, destroys a resource. Once set to \\`true\\`, the \\`time\\_remaining\\` value will display the amount of time left until the destroyed resource is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed resource can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the resource is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Overwrite</nobr> | none | If set to \\`true\\`, overwrites an existing volume during a volume copy operation. If set to \\`false\\` or not set at all and the target name is an existing volume, the volume copy operation fails. Required if the \\`source: id\\` or \\`source: name\\` body parameter is set and the source overwrites an existing volume during the volume copy operation. | false | False | None |
| <nobr>Provisioned</nobr> | none | Sets the virtual size of the volume. Measured in bytes. | false | False | None |
| <nobr>Qos</nobr> | none | Sets QoS limits. | false | False | None |
| <nobr>Source</nobr> | none | The source volume of a volume copy. | false | False | None |
| <nobr>Subtype</nobr> | none | The type of volume. Valid values are \\`protocol\\_endpoint\\` and \\`regular\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2Volume -Array $Array -Provisioned $size -Name $VolumeName
```
Create a new volume on FlashArray with provisioned size as $Size and name $VolumeName

**Example 2**
```powershell
New-Pfa2Volume -Array $Array -Provisioned $size -Name $VolumeName -ApiVersion $_
```
Create a new volume on FlashArray using a specific REST version with ApiVersion param

**Example 3**
```powershell
$VolumeName1,$VolumeName2,$VolumeName3,$VolumeName4,$VolumeName5 | New-Pfa2Volume -Array $Array -Provisioned $Size
```
Create five volumes using pipeline, all with provisioned size $Size

## New-Pfa2VolumeGroup
### Synopsis
Create a volume group
### Syntax
```powershell

New-Pfa2VolumeGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [-Qos <Qos>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Qos</nobr> | none | Qos bandwidth | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2VolumeGroup -Array $Array -Name $VolumeGroupName
```
Create a new volume group on FlashArray with name $VolumeGroupName

## New-Pfa2VolumeProtectionGroup
### Synopsis
Add a volume to a protection group
### Syntax
```powershell

New-Pfa2VolumeProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2VolumeProtectionGroup -Array $Array -GroupNames $ProtectionGroupName -MemberNames $Volume.Name
```
Add a volume $Volume.Name to protection group $ProtectionGroupName on FlashArray

## New-Pfa2VolumeSnapshot
### Synopsis
Generate a volume snapshot
### Syntax
```powershell

New-Pfa2VolumeSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-On <String>] [-SourceIds <System.Collections.Generic.List`1[System.String]>] [-SourceNames <System.Collections.Generic.List`1[System.String]>] [-Suffix <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, destroys a resource. Once set to \\`true\\`, the \\`time\\_remaining\\` value will display the amount of time left until the destroyed resource is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed resource can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the resource is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. For example, \\`targetName01\\`. | false | False | None |
| <nobr>SourceIds</nobr> | none | Performs the operation on the source ID specified. Enter multiple source IDs in comma-separated format. | false | False | None |
| <nobr>SourceNames</nobr> | none | Performs the operation on the source name specified. Enter multiple source names in comma-separated format. For example, \\`name01,name02\\`. | false | False | None |
| <nobr>Suffix</nobr> | none | The suffix that is appended to the \\`source\\_name\\` value to generate the full volume snapshot name in the form \\`VOL.SUFFIX\\`. If the suffix is not specified, the system constructs the snapshot name in the form \\`VOL.NNN\\`, where \\`VOL\\` is the volume name, and \\`NNN\\` is a monotonically increasing number. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
New-Pfa2VolumeSnapshot -Array $Array -Suffix "powershell" -SourceNames $Volume.Name
```
Create a volume snapshot with suffix "powershell" for volume $Volume.Name on FlashArray

## Remove-Pfa2Admin
### Synopsis
Deletes an administrator
### Syntax
```powershell

Remove-Pfa2Admin [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Admin -Array $Array -Name $Name
```
Remove array administrator with name $Name

## Remove-Pfa2AdminApiToken
### Synopsis
Delete API tokens
### Syntax
```powershell

Remove-Pfa2AdminApiToken [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2AdminApiToken -Array $Array -Name $Name
```
Remove API token of array admin $Name

## Remove-Pfa2AdminCache
### Synopsis
Delete cache entries
### Syntax
```powershell

Remove-Pfa2AdminCache [-ApiVersion <String>] [-Array <Rest2Api>] [-RemoveAllEntries <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>RemoveAllEntries</nobr> | none | When deleting entries from the admin cache, set to \\`true\\` to remove all entries from the cache. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2AdminCache -Array $Array -RemoveAllEntries $True
```
Remove all array administrators cache from FlashArray

## Remove-Pfa2ApiClient
### Synopsis
Delete an API client
### Syntax
```powershell

Remove-Pfa2ApiClient [-ApiVersion <String>] [-Array <Rest2Api>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ApiClient -Array $Array -Name $ClientName
```
Remove API client with name $ClientName

## Remove-Pfa2Connection
### Synopsis
Delete a connection between a volume and its host or host group
### Syntax
```powershell

Remove-Pfa2Connection [-ApiVersion <String>] [-Array <Rest2Api>] [-HostGroupNames <System.Collections.Generic.List`1[System.String]>] [-HostNames <System.Collections.Generic.List`1[System.String]>] [-VolumeNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>HostGroupNames</nobr> | none | Performs the operation on the host group specified. Enter multiple names in comma-separated format. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple host group names and volume names; instead, at least one of the objects \\(e.g., \\`HostGroupNames\\`\) must be set to only one name \\(e.g., \\`hgroup01\\`\). | false | False | None |
| <nobr>HostNames</nobr> | none | Performs the operation on the hosts specified. Enter multiple names in comma-separated format. For example, \\`host01,host02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple host names and volume names; instead, at least one of the objects \\(e.g., \\`HostNames\\`\) must be set to only one name \\(e.g., \\`host01\\`\). | false | False | None |
| <nobr>VolumeNames</nobr> | none | Performs the operation on the volume specified. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. A request cannot include a mix of multiple objects with multiple names. For example, a request cannot include a mix of multiple volume names and host names; instead, at least one of the objects \\(e.g., \\`VolumeNames\\`\) must be set to only one name \\(e.g., \\`vol01\\`\). | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Connection -Array $Array -HostNames $Host_.Name -VolumeNames $Volume.Name
```
Remove the connection between volume $Volume.Name and host $Host\\_.Name

**Example 2**
```powershell
Remove-Pfa2Connection -Array $Array -HostGroupNames $HostGroup.Name -VolumeNames $Volume.Name
```
Remove the connection between volume $Volume.Name and host group $HostGroup.Name

## Remove-Pfa2Host
### Synopsis
Delete a host
### Syntax
```powershell

Remove-Pfa2Host [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Host -Array $Array -Name $HostName
```
Remove a host named $HostName

## Remove-Pfa2HostGroup
### Synopsis
Delete a host group
### Syntax
```powershell

Remove-Pfa2HostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2HostGroup -Array $Array -Name $NewHostGroupName
```
Remove the host group named $NewHostGroupName

## Remove-Pfa2HostGroupHost
### Synopsis
Remove a host from a host group
### Syntax
```powershell

Remove-Pfa2HostGroupHost [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2HostGroupHost -Array $Array -GroupNames  $HostGroupName -MemberNames $NewHost.Name
```
Remove host $NewHost.Name from host group $HostGroupName

## Remove-Pfa2HostGroupProtectionGroup
### Synopsis
Delete a host group from a protection group
### Syntax
```powershell

Remove-Pfa2HostGroupProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2HostGroupProtectionGroup -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHostGroup.Name
```
Remove host group $NewHostGroup.Name from protection group $ProtectionGroupName

## Remove-Pfa2HostHostGroup
### Synopsis
Remove a host from a host group
### Syntax
```powershell

Remove-Pfa2HostHostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2HostHostGroup -Array $Array -GroupNames  $HostGroupName -MemberNames $NewHost.Name
```
Remove host $NewHost.Name from host group $HostGroupName

## Remove-Pfa2HostProtectionGroup
### Synopsis
Delete a host from a protection group
### Syntax
```powershell

Remove-Pfa2HostProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2HostProtectionGroup -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHost.Name
```
Remove host $NewHost.Name from protection group $ProtectionGroupName

## Remove-Pfa2Kmip
### Synopsis
Delete KMIP server object
### Syntax
```powershell

Remove-Pfa2Kmip [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Kmip -Array $Array -Name $kmipName
```
Remove a Kmip server by name $kmipName

## Remove-Pfa2MaintenanceWindow
### Synopsis
Delete maintenance window
### Syntax
```powershell

Remove-Pfa2MaintenanceWindow [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2MaintenanceWindow -Array $Array -Name "environment"
```
Remove maintenance window named "environment"

## Remove-Pfa2Offload
### Synopsis
Delete offload target
### Syntax
```powershell

Remove-Pfa2Offload [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Offload -Array $Array -Name $NFSTargetName
```
Remove offload target $NFSTargetName from the FlashArray

## Remove-Pfa2Pod
### Synopsis
Delete a pod
### Syntax
```powershell

Remove-Pfa2Pod [-ApiVersion <String>] [-Array <Rest2Api>] [-Confirm] [-Eradicate] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-WhatIf] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Confirm</nobr> | cf | Prompts you for confirmation before running the cmdlet. | false | False | False |
| <nobr>Eradicate</nobr> | none | Permanently delete Pod | false | False | False |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>WhatIf</nobr> | wi | Shows what would happen if the cmdlet runs. The cmdlet is not run. | false | False | False |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Pod -Array $TargetArray -Name $RemotePodName -Eradicate  -Confirm:$false
```
Eradicate a remote pod with name $RemotePodName

**Example 2**
```powershell
Remove-Pfa2Pod -Array $Array -Name $Pod.Name -Eradicate -Confirm:$false -ErrorAction Stop
```
Eradicate a POD $Pod.Name \\(Only destroyed PODs can be eradicated\)

## Remove-Pfa2PodArray
### Synopsis
Unstretch a pod from an array
### Syntax
```powershell

Remove-Pfa2PodArray [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupIds <System.Collections.Generic.List`1[System.String]>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberIds <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [-WithUnknown <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupIds</nobr> | none | A list of group IDs. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberIds</nobr> | none | A list of member IDs. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
| <nobr>WithUnknown</nobr> | none | If set to \\`true\\`, unstretches the specified pod from the specified array by force. Use the \\`WithUnknown\\` parameter in the following rare event&\#58; the local array goes offline while the pod is still stretched across two arrays, the status of the remote array becomes unknown, and there is no guarantee that the pod is online elsewhere. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Remove-Pfa2PodReplicaLink
### Synopsis
Delete pod replica links
### Syntax
```powershell

Remove-Pfa2PodReplicaLink [-ApiVersion <String>] [-Array <Rest2Api>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-LocalPodIds <System.Collections.Generic.List`1[System.String]>] [-LocalPodNames <System.Collections.Generic.List`1[System.String]>] [-RemotePodIds <System.Collections.Generic.List`1[System.String]>] [-RemotePodNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`names\\` parameters cannot be provided together. | false | False | None |
| <nobr>LocalPodIds</nobr> | none | A list of local pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodNames\\` query parameter. | false | False | None |
| <nobr>LocalPodNames</nobr> | none | A list of local pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodIds\\` query parameter. | false | False | None |
| <nobr>RemotePodIds</nobr> | none | A list of remote pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodNames\\` query parameter. | false | False | None |
| <nobr>RemotePodNames</nobr> | none | A list of remote pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodIds\\` query parameter. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2PodReplicaLink -Array $Array -LocalPodNames $LocalPodName -RemotePodNames $RemotePodName
```
Remove a POD replica link from FlashArray where local pod names is $LocalPodName and remote pod names is $RemotePodName

## Remove-Pfa2ProtectionGroup
### Synopsis
Eradicate a protection group
### Syntax
```powershell

Remove-Pfa2ProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Confirm] [-Eradicate] [-Name <String>] [-WhatIf] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Confirm</nobr> | cf | Prompts you for confirmation before running the cmdlet. | false | False | False |
| <nobr>Eradicate</nobr> | none | Permanently delete ProtectionGroup | false | False | False |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>WhatIf</nobr> | wi | Shows what would happen if the cmdlet runs. The cmdlet is not run. | false | False | False |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ProtectionGroup -Array $Array -Name $NewProtectionGroupName -Eradicate -Confirm:$false
```
Eradicate protection group with name $NewProtectionGroupName \\(Only destroyed protection groups can be eradicated\)

## Remove-Pfa2ProtectionGroupHost
### Synopsis
Remove a host from a protection group
### Syntax
```powershell

Remove-Pfa2ProtectionGroupHost [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ProtectionGroupHost -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHost.Name
```
Remove a host $NewHost.Name from protection group $ProtectionGroupName

## Remove-Pfa2ProtectionGroupHostGroup
### Synopsis
Remove a host group from a protection group
### Syntax
```powershell

Remove-Pfa2ProtectionGroupHostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ProtectionGroupHostGroup -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewHostGroup.Name
```
Remove a host group $NewHostGroup.Name from protection group $ProtectionGroupName

## Remove-Pfa2ProtectionGroupSnapshot
### Synopsis
Delete a protection group snapshot
### Syntax
```powershell

Remove-Pfa2ProtectionGroupSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ProtectionGroupSnapshot -Array $Array -Name $SnapshotName
```
Eradicate a protection group snapshot named $SnapshotName

## Remove-Pfa2ProtectionGroupTarget
### Synopsis
Removes a target from a protection group
### Syntax
```powershell

Remove-Pfa2ProtectionGroupTarget [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ProtectionGroupTarget -Array $testarray -GroupNames $ProtectionGroupName -MemberNames $NFSTargetName
```
Remove target $NFSTargetName from protection group $ProtectionGroupName

## Remove-Pfa2ProtectionGroupVolume
### Synopsis
Remove a volume from a protection group
### Syntax
```powershell

Remove-Pfa2ProtectionGroupVolume [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2ProtectionGroupVolume -Array $Array -GroupNames  $ProtectionGroupName -MemberNames $NewVolume.Name
```
Remove a volume $NewVolume.Name from protection group $ProtectionGroupName on FlashArray

## Remove-Pfa2RemoteProtectionGroup
### Synopsis
Eradicate a remote protection group
### Syntax
```powershell

Remove-Pfa2RemoteProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-On <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. For example, \\`targetName01\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2RemoteProtectionGroup -Array $Array -Name $RemotePGname -On "nfstarget"
```
Eradicate the remote protection group $RemotePGName from offload target "nfstarget"

## Remove-Pfa2RemoteProtectionGroupSnapshot
### Synopsis
Eradicate a remote protection group snapshot
### Syntax
```powershell

Remove-Pfa2RemoteProtectionGroupSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [-On <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. For example, \\`targetName01\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2RemoteProtectionGroupSnapshot -Array $testarray -Name $PeergroupSnapshot -On $NFSTargetName
```
Eradicate a remote protection group snapshot named $PeergroupSnapshot on remote target $NFSTargetName

## Remove-Pfa2Subnet
### Synopsis
Delete subnet
### Syntax
```powershell

Remove-Pfa2Subnet [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Subnet -Array $Array -Name $Name
```
Remove a subnet of FlashArray with a specific name

## Remove-Pfa2Volume
### Synopsis
Delete a volume
### Syntax
```powershell

Remove-Pfa2Volume [-ApiVersion <String>] [-Array <Rest2Api>] [-Confirm] [-Eradicate] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-WhatIf] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Confirm</nobr> | cf | Prompts you for confirmation before running the cmdlet. | false | False | False |
| <nobr>Eradicate</nobr> | none | Permanently delete Volume | false | False | False |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>WhatIf</nobr> | wi | Shows what would happen if the cmdlet runs. The cmdlet is not run. | false | False | False |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2Volume -Array $Array -Name $vol.Name -Eradicate -Confirm:$false
```
Eradicate a volume $vol.Name \\(Only destroyed volumes can be eradicated\)

## Remove-Pfa2VolumeGroup
### Synopsis
Eradicate a volume group
### Syntax
```powershell

Remove-Pfa2VolumeGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Confirm] [-Eradicate] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-WhatIf] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Confirm</nobr> | cf | Prompts you for confirmation before running the cmdlet. | false | False | False |
| <nobr>Eradicate</nobr> | none | Permanently delete VolumeGroup | false | False | False |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>WhatIf</nobr> | wi | Shows what would happen if the cmdlet runs. The cmdlet is not run. | false | False | False |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2VolumeGroup -Array $Array -Name $VolGroup.name -Eradicate -Confirm:$false
```
Eradicate a volume group $VolGroup.Name \\(Only destroyed volume groups can be eradicated\)

## Remove-Pfa2VolumeProtectionGroup
### Synopsis
Remove a volume from a protection group
### Syntax
```powershell

Remove-Pfa2VolumeProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2VolumeProtectionGroup -Array $Array -GroupNames $PG.Name -MemberNames $hst.Member.Name
```
Remove the host $hst.Member.Name from protection group $PG.Name from FlashArray

## Remove-Pfa2VolumeSnapshot
### Synopsis
Eradicate a volume snapshot
### Syntax
```powershell

Remove-Pfa2VolumeSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Confirm] [-Eradicate] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-WhatIf] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Confirm</nobr> | cf | Prompts you for confirmation before running the cmdlet. | false | False | False |
| <nobr>Eradicate</nobr> | none | Permanently delete VolumeSnapshot | false | False | False |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>WhatIf</nobr> | wi | Shows what would happen if the cmdlet runs. The cmdlet is not run. | false | False | False |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2VolumeSnapshot -Array $Array -Name $Result.Name -Eradicate -Confirm:$false
```
Eradicate a volume snapshot on FlashArray for volume snapshot $Result.Name \\(Only destroyed snapshots can be eradicated\)s

## Remove-Pfa2VolumeSnapshotTags
### Synopsis
Delete tags
### Syntax
```powershell

Remove-Pfa2VolumeSnapshotTags [-ApiVersion <String>] [-Array <Rest2Api>] [-Keys <System.Collections.Generic.List`1[System.String]>] [-Namespaces <System.Collections.Generic.List`1[System.String]>] [-ResourceIds <System.Collections.Generic.List`1[System.String]>] [-ResourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Keys</nobr> | none | A list of tag keys. | false | False | None |
| <nobr>Namespaces</nobr> | none | A list of namespaces. | false | False | None |
| <nobr>ResourceIds</nobr> | none | A list of resource IDs. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>ResourceNames</nobr> | none | A list of resource names. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2VolumeSnapshotTags -Array $Array -Keys "Key2" -ResourceNames $Result.Name
```
Delete a tag with key "key2" on volume snapshot $Result.Name

## Remove-Pfa2VolumeTag
### Synopsis
Delete tags
### Syntax
```powershell

Remove-Pfa2VolumeTag [-ApiVersion <String>] [-Array <Rest2Api>] [-Keys <System.Collections.Generic.List`1[System.String]>] [-Namespaces <System.Collections.Generic.List`1[System.String]>] [-ResourceIds <System.Collections.Generic.List`1[System.String]>] [-ResourceNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Keys</nobr> | none | A list of tag keys. | false | False | None |
| <nobr>Namespaces</nobr> | none | A list of namespaces. | false | False | None |
| <nobr>ResourceIds</nobr> | none | A list of resource IDs. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>ResourceNames</nobr> | none | A list of resource names. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Remove-Pfa2VolumeTag -Array $Array -Keys "environment2" -ResourceNames $Volume.Name
```
Delete a tag with Keys "environment2" on volume $Volume.Name

## Set-Pfa2AdminCache
### Synopsis
Update or refresh entries in the administrator cache
### Syntax
```powershell

Set-Pfa2AdminCache [-ApiVersion <String>] [-Array <Rest2Api>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Set-Pfa2AdminCache -Array $Array -Name $Admin.Name
```
Set admin cache for array admin $Admin.Name on FlashArray

## Set-Pfa2VolumeSnapshotTagsBatch
### Synopsis
Update tags
### Syntax
```powershell

Set-Pfa2VolumeSnapshotTagsBatch [-ApiVersion <String>] [-Array <Rest2Api>] [-ResourceIds <System.Collections.Generic.List`1[System.String]>] [-ResourceNames <System.Collections.Generic.List`1[System.String]>] -Tag <System.Collections.Generic.List`1[PureStorage.FlashArray.Rest.Model.Tag]> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>ResourceIds</nobr> | none | A list of resource IDs. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>ResourceNames</nobr> | none | A list of resource names. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>Tag</nobr> | none | A list of tags to be created or modified. | true | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Set-Pfa2VolumeSnapshotTagsBatch -Array $Array -Tag $Tag -ResourceNames $Result.Name
```
Set a tag on volume snapshot with name $Result.Name on FlashArray \\(See New-Pfa2TagObject\)

## Set-Pfa2VolumeTagBatch
### Synopsis
Update tags
### Syntax
```powershell

Set-Pfa2VolumeTagBatch [-ApiVersion <String>] [-Array <Rest2Api>] [-ResourceIds <System.Collections.Generic.List`1[System.String]>] [-ResourceNames <System.Collections.Generic.List`1[System.String]>] -Tag <System.Collections.Generic.List`1[PureStorage.FlashArray.Rest.Model.Tag]> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>ResourceIds</nobr> | none | A list of resource IDs. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>ResourceNames</nobr> | none | A list of resource names. The \\`ResourceIds\\` and \\`ResourceNames\\` parameters cannot be provided together. | false | False | None |
| <nobr>Tag</nobr> | none | A list of tags to be created or, if already existing, updated. | true | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Set-Pfa2VolumeTagBatch -Array $Array -Tag $Tag -ResourceNames $Volume.Name
```
Set a tag \\(created using New-Pfa2TagObject\) on volume $Volume.Name on FlashArray

## Update-Pfa2Admin
### Synopsis
Modify an administrator
### Syntax
```powershell

Update-Pfa2Admin [-ApiVersion <String>] [-Array <Rest2Api>] [-Locked <Boolean>] [-Name <String>] [-OldPassword <String>] [-Password <String>] [-PublicKey <String>] [-RoleName <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Locked</nobr> | none | Returns a value of \\`true\\` if the user is currently locked out, otherwise \\`false\\`. Can be patched to \\`false\\` to unlock a user. This field is only visible to \\`array\\_admin\\` roles. For all other users, the value is always \\`null\\`. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>OldPassword</nobr> | none | The current password. | false | False | None |
| <nobr>Password</nobr> | none | Password associated with the account. | false | False | None |
| <nobr>PublicKey</nobr> | none | Public key for SSH access. | false | False | None |
| <nobr>RoleName</nobr> | none | Privilege level. Valid values include \\`array\\_admin\\`, \\`storage\\_admin\\`, and \\`readonly\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Update-Pfa2AdminSetting
### Synopsis
Modify administrator settings
### Syntax
```powershell

Update-Pfa2AdminSetting [-ApiVersion <String>] [-Array <Rest2Api>] [-LockoutDuration <Int64>] [-MaxLoginAttempts <Int32>] [-MinPasswordLength <Int32>] [-SingleSignOnEnabled <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>LockoutDuration</nobr> | none | The lockout duration, in milliseconds, if a user is locked out after reaching the maximum number of login attempts. Ranges from 1 second to 90 days. | false | False | None |
| <nobr>MaxLoginAttempts</nobr> | none | Maximum number of failed login attempts allowed before the user is locked out. | false | False | None |
| <nobr>MinPasswordLength</nobr> | none | Minimum password length. If not specified, defaults to 1. | false | False | None |
| <nobr>SingleSignOnEnabled</nobr> | none | If \\`true\\`, then single sign-on is enabled for the array. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2AdminSetting -Array $Array -LockoutDuration 1000 -MaxLoginAttempts 3 -MinPasswordLength 10
```
Update global array admin setting. Lockout duration to 1000 secs, maximum login attempts to 3 and minimum password length to 10

**Example 2**
```powershell
Update-Pfa2AdminSetting -Array $Array -MaxLoginAttempts 2
```
Update global array admin setting. Maximum login attempts to only 2

**Example 3**
```powershell
Update-Pfa2AdminSetting -Array $Array -LockoutDuration 2000
```
Update global array admin setting. Lockout duration to 2000 seconds

## Update-Pfa2Alert
### Synopsis
Modify flagged state
### Syntax
```powershell

Update-Pfa2Alert [-ApiVersion <String>] [-Array <Rest2Api>] [-Flagged <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Flagged</nobr> | none | If set to \\`true\\`, the message is flagged. Important messages can can be flagged and listed separately. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Alert -Array $Array -Name $_.Name -Flagged $True
```
Flag an array alert with name $\\_.Name

## Update-Pfa2ApiClient
### Synopsis
Manage an API client
### Syntax
```powershell

Update-Pfa2ApiClient [-ApiVersion <String>] [-Array <Rest2Api>] [-Enabled <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Enabled</nobr> | none | Returns a value of \\`true\\` if the API client is permitted to exchange ID tokens for access tokens. API clients are disabled by default. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2ApiClient -Array $Array -Enabled $True -Name $ClientName
```
Enable API client with name $ClientName

## Update-Pfa2App
### Synopsis
Modify app
### Syntax
```powershell

Update-Pfa2App [-ApiVersion <String>] [-Array <Rest2Api>] [-Enabled <Boolean>] -Name <String> [-VncEnabled <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Enabled</nobr> | none | If set to \\`true\\`, the app is enabled. By default, apps are disabled. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. For example, \\`name01\\`. Enter multiple names in comma-separated format. | true | True \\(ByPropertyName, ByValue\) | None |
| <nobr>VncEnabled</nobr> | none | If set to \\`true\\`, VNC access is enabled. By default, VNC access is disabled. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2App -Array $testarray -Name $app.Name -Enabled $true
```
Find an app in PureArray by name and set it enabled

## Update-Pfa2Array
### Synopsis
Modify an array
### Syntax
```powershell

Update-Pfa2Array [-ApiVersion <String>] [-Array <Rest2Api>] [-ArrayName <String>] [-Banner <String>] [-ConsoleLockEnabled <Boolean>] [-IdleTimeout <Int32>] [-NtpServers <System.Collections.Generic.List`1[System.String]>] [-ScsiTimeout <Int32>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>ArrayName</nobr> | none | A user-specified name. The name must be locally unique and can be changed. | false | False | None |
| <nobr>Banner</nobr> | none | The welcome banner for the array. The banner is displayed on the GUI login screen and in the console login messages. | false | False | None |
| <nobr>ConsoleLockEnabled</nobr> | none | Enables or disables the console lock. When the lock is disabled the array allows root logins at the console. | false | False | None |
| <nobr>IdleTimeout</nobr> | none | Idle timeout in milliseconds. Valid values are \\`0\\` and any multiple of 60000 in the range of 300000 and 10800000. Any other values will be rounded down to the nearest multiple of 60000. | false | False | None |
| <nobr>NtpServers</nobr> | none | Alternate NTP servers, by IP address or hostname, assigned as the array source for reference time. Supersedes any previous NTP server assignments. | false | False | None |
| <nobr>ScsiTimeout</nobr> | none | The SCSI timeout. This value defaults to 60s if it is not specified. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Array -Array $Array -IdleTimeout $DisableIdleTimeout
```
Update FlashArray with a new idletimeout

**Example 2**
```powershell
Update-Pfa2Array -Array $Array -ScsiTimeout $MinIdleTimeout
```
Update FlashArray with a new ScsiTimeout

## Update-Pfa2ArrayEula
### Synopsis
Modify signature on the End User Agreement
### Syntax
```powershell

Update-Pfa2ArrayEula [-ApiVersion <String>] [-Array <Rest2Api>] [-Signature <EulaSignature>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Signature</nobr> | none | Acceptance details of the Pure Storage End User Agreement. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2ArrayEula -Array $Array -Signature $Signature
```
Update array eula setting with new signature. Signature object could be created from New-Pfa2EulaSignatureObject cmdlet

## Update-Pfa2DirectoryService
### Synopsis
Modify directory services configuration
### Syntax
```powershell

Update-Pfa2DirectoryService [-ApiVersion <String>] [-Array <Rest2Api>] [-BaseDn <String>] [-BindPassword <String>] [-BindUser <String>] [-CaCertificate <String>] [-CheckPeer <Boolean>] [-Enabled <Boolean>] [-Management <DirectoryServiceManagement>] -Name <String> [-Uris <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>BaseDn</nobr> | none | Base of the Distinguished Name \\(DN\) of the directory service groups. | false | False | None |
| <nobr>BindPassword</nobr> | none | Masked password used to query the directory. | false | False | None |
| <nobr>BindUser</nobr> | none | Username used to query the directory. | false | False | None |
| <nobr>CaCertificate</nobr> | none | The certificate of the Certificate Authority \\(CA\) that signed the certificates of the directory servers, which is used to validate the authenticity of the configured servers. | false | False | None |
| <nobr>CheckPeer</nobr> | none | Whether or not server authenticity is enforced when a certificate is provided. | false | False | None |
| <nobr>Enabled</nobr> | none | Whether or not the directory service is enabled. | false | False | None |
| <nobr>Management</nobr> | none | Properties specific to the management service. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. For example, \\`name01\\`. Enter multiple names in comma-separated format. | true | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Uris</nobr> | none | List of URIs for the configured directory servers. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2DirectoryService -Array $Array -Name $response.Name -BindUser $bindUser -BindPassword $bindPassword -BaseDN $baseDN -URIS $DSUri
```
Find directory service by name $response.Name and update with the new values ofBindUser, BindPassword, BaseDN, and URIS

## Update-Pfa2DirectoryServiceRole
### Synopsis
Modify directory services roles
### Syntax
```powershell

Update-Pfa2DirectoryServiceRole [-ApiVersion <String>] [-Array <Rest2Api>] [-Group <String>] [-GroupBase <String>] -RoleNames <System.Collections.Generic.List`1[System.String]> [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Group</nobr> | none | Common Name \\(CN\) of the directory service group that contains users with the authority level of the specified role name. | false | False | None |
| <nobr>GroupBase</nobr> | none | Specifies where the configured group is located in the directory tree. | false | False | None |
| <nobr>RoleNames</nobr> | none | Performs the operation on the unique roles specified. For example, \\`array\\_admin\\`. Enter multiple roles in comma-separated format. | true | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2DirectoryServiceRole -Array $Array -RoleNames $ArrayAdmin -Group $Group -GroupBase $GroupBase
```
Find directory service role by role name $ArrayAdmin and update with new values of Group and GroupBase

## Update-Pfa2Dns
### Synopsis
Modify DNS parameters
### Syntax
```powershell

Update-Pfa2Dns [-ApiVersion <String>] [-Array <Rest2Api>] [-Domain <String>] [-Nameservers <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Domain</nobr> | none | Domain suffix to be appended by the appliance when performing DNS lookups. | false | False | None |
| <nobr>Nameservers</nobr> | none | List of DNS server IP addresses. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2DNS -Array $Array -NameServers $nameServers -Domain $domain
```
Update dns informaion with new values of NameServers and Domain

## Update-Pfa2Hardware
### Synopsis
Modify visual identification
### Syntax
```powershell

Update-Pfa2Hardware [-ApiVersion <String>] [-Array <Rest2Api>] [-IdentifyEnabled <Boolean>] [-Index <Int32>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>IdentifyEnabled</nobr> | none | State of an LED used to visually identify the component. | false | False | None |
| <nobr>Index</nobr> | none | Number that identifies the relative position of a hardware component within the array. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
PS C:\> {{ Add example code here }}
```
\\{\\{ Add example description here \\}\\}

## Update-Pfa2Host
### Synopsis
Manage a host
### Syntax
```powershell

Update-Pfa2Host [-AddIqns <System.Collections.Generic.List`1[System.String]>] [-AddNqns <System.Collections.Generic.List`1[System.String]>] [-AddWwns <System.Collections.Generic.List`1[System.String]>] [-ApiVersion <String>] [-Array <Rest2Api>] [-Chap <Chap>] [-HostGroupName <String>] [-HostName <String>] [-Iqns <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-Nqns <System.Collections.Generic.List`1[System.String]>] [-Personality <String>] [-PreferredArrays <System.Collections.Generic.List`1[PureStorage.FlashArray.Rest.Model.Reference]>] [-RemoveIqns <System.Collections.Generic.List`1[System.String]>] [-RemoveNqns <System.Collections.Generic.List`1[System.String]>] [-RemoveWwns <System.Collections.Generic.List`1[System.String]>] [-Wwns <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AddIqns</nobr> | none | Adds the specified iSCSI Qualified Names \\(IQNs\) to those already associated with the specified host. | false | False | None |
| <nobr>AddNqns</nobr> | none | Adds the specified NVMe Qualified Names \\(NQNs\) to those already associated with the specified host. | false | False | None |
| <nobr>AddWwns</nobr> | none | Adds the specified Fibre Channel World Wide Names \\(WWNs\) to those already associated with the specified host. | false | False | None |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Chap</nobr> | none | Challenge-Handshake Authentication Protocol \\(CHAP\). | false | False | None |
| <nobr>HostGroupName</nobr> | none | The host group to which the host should be associated. | false | False | None |
| <nobr>HostName</nobr> | none | The new name for the resource. | false | False | None |
| <nobr>Iqns</nobr> | none | The iSCSI qualified name \\(IQN\) associated with the host. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Nqns</nobr> | none | The NVMe Qualified Name \\(NQN\) associated with the host. | false | False | None |
| <nobr>Personality</nobr> | none | Determines how the system tunes the array to ensure that it works optimally with the host. Set \\`personality\\` to the name of the host operating system or virtual memory system. Valid values are \\`aix\\`, \\`esxi\\`, \\`hitachi-vsp\\`, \\`hpux\\`, \\`oracle-vm-server\\`, \\`solaris\\`, and \\`vms\\`. If your system is not listed as one of the valid host personalities, do not set the option. By default, the personality is not set. | false | False | None |
| <nobr>PreferredArrays</nobr> | none | For synchronous replication configurations, sets a host's preferred array to specify which array exposes active/optimized paths to that host. Enter multiple preferred arrays in comma-separated format. If a preferred array is set for a host, then the other arrays in the same pod will expose active/non-optimized paths to that host. If the host is in a host group, \\`preferred\\_arrays\\` cannot be set because host groups have their own preferred arrays. On a preferred array of a certain host, all the paths on all the ports \\(for both the primary and secondary controllers\) are set up as A/O \\(active/optimized\) paths, while on a non-preferred array, all the paths are A/N \\(Active/Non-optimized\) paths. | false | False | None |
| <nobr>RemoveIqns</nobr> | none | Disassociates the specified iSCSI Qualified Names \\(IQNs\) from the specified host. | false | False | None |
| <nobr>RemoveNqns</nobr> | none | Disassociates the specified NVMe Qualified Names \\(NQNs\) from the specified host. | false | False | None |
| <nobr>RemoveWwns</nobr> | none | Disassociates the specified Fibre Channel World Wide Names \\(WWNs\) from the specified host. | false | False | None |
| <nobr>Wwns</nobr> | none | The Fibre Channel World Wide Name \\(WWN\) associated with the host. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Host -Array $Array -Name $HostName -iqns $iqns -Chap $newChap
```
Find a host named $HostName and update its values of Name, iqns, and Chap

**Example 2**
```powershell
Update-Pfa2Host -Array $Array -Name $HostName -HostGroupName $HostGroupName
```
Find a host named $HostName and update its host group.

## Update-Pfa2HostGroup
### Synopsis
Manage a host group
### Syntax
```powershell

Update-Pfa2HostGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-HostGroupName <String>] [-Name <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>HostGroupName</nobr> | none | The new name for the resource. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2HostGroup -Array $Array -Name $HostGroupName -HostGroupName $NewHostGroupName
```
Find a host group named $HostGroupName and update it with a new name $NewHostGroupName

## Update-Pfa2Kmip
### Synopsis
Modify KMIP attributes
### Syntax
```powershell

Update-Pfa2Kmip [-ApiVersion <String>] [-Array <Rest2Api>] [-CaCertificate <String>] [-CertificateName <String>] [-Name <String>] [-Uris <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>CaCertificate</nobr> | none | The text of the CA certificate for the KMIP server. | false | False | None |
| <nobr>CertificateName</nobr> | none | The certificate used to verify FlashArray authenticity to the KMIP servers. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Uris</nobr> | none | List of URIs for the configured KMIP servers. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Kmip -Array $Array -Name $kmipName -Uri $NewHostName
```
Get a Kmip server by name $kmipName

## Update-Pfa2Pod
### Synopsis
Modify a pod
### Syntax
```powershell

Update-Pfa2Pod [-AbortQuiesce <Boolean>] [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-FailoverPreferences <System.Collections.Generic.List`1[PureStorage.FlashArray.Rest.Model.Reference]>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Mediator <String>] [-Name <String>] [-PodName <String>] [-PromoteFrom <String>] [-Quiesce <Boolean>] [-RequestedPromotionState <String>] [-SkipQuiesce <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>AbortQuiesce</nobr> | none | Set to \\`true\\` to promote the pod when the \\`pod-replica-link\\` is in the \\`quiescing\\` state and abort when waiting for the \\`pod-replica-link\\` to complete the quiescing operation. | false | False | None |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, the pod has been destroyed and is pending eradication. The \\`time\\_remaining\\` value displays the amount of time left until the destroyed pod is permanently eradicated. A pod can only be destroyed if it is empty, so before destroying a pod, ensure all volumes and protection groups inside the pod have been either moved out of the pod or destroyed. A stretched pod cannot be destroyed unless you unstretch it first. Before the \\`time\\_remaining\\` period has elapsed, the destroyed pod can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the pod is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>FailoverPreferences</nobr> | none | Determines which array within a stretched pod should be given priority to stay online should the arrays ever lose contact with each other. The current array and any peer arrays that are connected to the current array for synchronous replication can be added to a pod for failover preference. By default, \\`failover\\_preferences=null\\`, meaning no arrays have been configured for failover preference. Enter multiple arrays in comma-separated format. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Mediator</nobr> | none | Sets the URL of the mediator for this pod, replacing the URL of the current mediator. By default, the Pure1 Cloud Mediator \\(\\`purestorage\\`\) serves as the mediator. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>PodName</nobr> | none | A user-specified name. The name must be locally unique and can be changed. | false | False | None |
| <nobr>PromoteFrom</nobr> | none | The \\`undo-demote\\` pod that should be used to promote the pod. After the pod has been promoted, it will have the same data as the \\`undo-demote\\` pod and the \\`undo-demote\\` pod will be eradicated. | false | False | None |
| <nobr>Quiesce</nobr> | none | Set to \\`true\\` to demote the pod after the \\`pod-replica-link\\` goes into \\`quiesced\\` state and allow the pod to become a target of the remote pod. This ensures that all local data has been replicated to the remote pod before the pod is demoted. | false | False | None |
| <nobr>RequestedPromotionState</nobr> | none | Patch \\`requested\\_promotion\\_state\\` to \\`demoted\\` to demote the pod so that it can be used as a link target for continuous replication between pods. Demoted pods do not accept write requests, and a destroyed version of the pod with \\`undo-demote\\` appended to the pod name is created on the array with the state of the pod when it was in the promoted state. Patch \\`requested\\_promotion\\_state\\` to \\`promoted\\` to start the process of promoting the pod. The \\`promotion\\_status\\` indicates when the pod has been successfully promoted. Promoted pods stop incorporating replicated data from the source pod and start accepting write requests. The replication process does not stop when the source pod continues replicating data to the pod. The space consumed by the unique replicated data is tracked by the \\`space.journal\\` field of the pod. | false | False | None |
| <nobr>SkipQuiesce</nobr> | none | Set to \\`true\\` to demote the pod without quiescing the \\`pod-replica-link\\` and allow the pod to become a target of the remote pod. This stops all pending replication to the remote pod. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Pod -Array $TargetArray -Name $RemotePodName -Destroyed $true
```
Destroy a remote pod with name $RemotePodName \\(This is not eradicated\)

**Example 2**
```powershell
Update-Pfa2Pod -Array $TargetArray -Name $RemotePod.Name -RequestedPromotionState "demoted"
```
Demote a remote POD with name $RemotePod.Name on FlashArray

**Example 3**
```powershell
Update-Pfa2Pod -Array $Array -Name $Pod.Name -Destroyed $True -ErrorAction Stop
```
Destroy a POD $Pod.Name. Assert if there is an error. \\(POD is not eradicated, see Remove-Pfa2Pod\)

## Update-Pfa2PodReplicaLink
### Synopsis
Modify pod replica links
### Syntax
```powershell

Update-Pfa2PodReplicaLink [-ApiVersion <String>] [-Array <Rest2Api>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-LocalPodIds <System.Collections.Generic.List`1[System.String]>] [-LocalPodNames <System.Collections.Generic.List`1[System.String]>] [-Paused <Boolean>] [-RemoteIds <System.Collections.Generic.List`1[System.String]>] [-RemoteNames <System.Collections.Generic.List`1[System.String]>] [-RemotePodIds <System.Collections.Generic.List`1[System.String]>] [-RemotePodNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`names\\` parameters cannot be provided together. | false | False | None |
| <nobr>LocalPodIds</nobr> | none | A list of local pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodNames\\` query parameter. | false | False | None |
| <nobr>LocalPodNames</nobr> | none | A list of local pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`LocalPodIds\\` query parameter. | false | False | None |
| <nobr>Paused</nobr> | none | Returns a value of \\`true\\` if the replica link is to be created in a \\`paused\\` state. Returns a value of \\`false\\` if the replica link is to be created not in a \\`paused\\` state. If not specified, defaults to \\`false\\`. | false | False | None |
| <nobr>RemoteIds</nobr> | none | A list of remote array IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteNames\\` query parameter. | false | False | None |
| <nobr>RemoteNames</nobr> | none | A list of remote array names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemoteIds\\` query parameter. | false | False | None |
| <nobr>RemotePodIds</nobr> | none | A list of remote pod IDs. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodNames\\` query parameter. | false | False | None |
| <nobr>RemotePodNames</nobr> | none | A list of remote pod names. If, after filtering, there is not at least one resource that matches each of the elements, then an error is returned. This cannot be provided together with the \\`RemotePodIds\\` query parameter. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2PodReplicaLink -Array $Array -LocalPodNames $LocalPodName -RemotePodNames $RemotePodName -Paused $True
```
Update the POD replica link status to paused where local pod names is $LocalPodName and remote pod names is $RemotePodName

## Update-Pfa2ProtectionGroup
### Synopsis
Manage a protection group
### Syntax
```powershell

Update-Pfa2ProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Name <String>] [-ProtectionGroupName <String>] [-ReplicationScheduleBlackout <TimeWindow>] [-SnapshotSchedule <SnapshotSchedule>] [-SourceRetention <RetentionPolicy>] [-TargetRetention <RetentionPolicy>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | Has this protection group been destroyed? To destroy a protection group, patch to \\`true\\`. To recover a destroyed protection group, patch to \\`false\\`. If not specified, defaults to \\`false\\`. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>ProtectionGroupName</nobr> | none | A user-specified name. The name must be locally unique and can be changed. | false | False | None |
| <nobr>ReplicationScheduleBlackout</nobr> | none | The schedule of a replication action. | false | False | None |
| <nobr>SnapshotSchedule</nobr> | none | The schedule settings for protection group snapshots. | false | False | None |
| <nobr>SourceRetention</nobr> | none | The retention policy for the source array of the protection group. | false | False | None |
| <nobr>TargetRetention</nobr> | none | The retention policy for the target\\(s\) of the protection group. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2ProtectionGroup -Array $Array -Name $ProtectionGroupName -ProtectionGroupName $NewProtectionGroupName
```
Update the name of protection group from $ProtectionGroupName to $NewProtectionGroupName

**Example 2**
```powershell
Update-Pfa2ProtectionGroup -Array $Array -Destroyed $true -Name $NewProtectionGroupName
```
Destroy the protection group with name $NewProtectionGroupname \\(This is not Eradicated\)

## Update-Pfa2ProtectionGroupSnapshot
### Synopsis
Modify a protection group snapshot
### Syntax
```powershell

Update-Pfa2ProtectionGroupSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Name <String>] [-ProtectionGroupSnapshotName <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | Returns a value of \\`true\\` if the protection group snapshot has been destroyed and is pending eradication. The \\`time\\_remaining\\` value displays the amount of time left until the destroyed snapshot is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed snapshot can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the snapshot is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>ProtectionGroupSnapshotName</nobr> | none | A user-specified name. The name must be locally unique and can be changed. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2ProtectionGroupSnapshot -Array $Array -Name $SnapshotName -Destroyed $true
```
Destroy a protection group snapshot named $SnapshotName

**Example 2**
```powershell
Update-Pfa2ProtectionGroupSnapshot -Array $Array -Name $DefaultSnapshotName -ProtectionGroupSnapshotName $NewSnapshotName
```
Update a protection group snapshot name to $NewSnapshotName from $DefaultSnapshotName

## Update-Pfa2ProtectionGroupTarget
### Synopsis
Manage a protection group target
### Syntax
```powershell

Update-Pfa2ProtectionGroupTarget [-Allowed <Boolean>] [-ApiVersion <String>] [-Array <Rest2Api>] [-GroupNames <System.Collections.Generic.List`1[System.String]>] [-MemberNames <System.Collections.Generic.List`1[System.String]>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>Allowed</nobr> | none | If set to \\`true\\`, the target array has allowed the source array to replicate protection group data to the target array. If set to \\`false\\`, the target array has not allowed the source array to replicate protection group data to the target. target-protection-group | false | False | None |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>GroupNames</nobr> | none | Performs the operation on the unique group name specified. Examples of groups include host groups, pods, protection groups, and volume groups. Enter multiple names in comma-separated format. For example, \\`hgroup01,hgroup02\\`. | false | False | None |
| <nobr>MemberNames</nobr> | none | Performs the operation on the unique member name specified. Examples of members include volumes, hosts, and host groups. Enter multiple names in comma-separated format. For example, \\`vol01,vol02\\`. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
# Update-Pfa2ProtectionGroupTarget -Array $Array -GroupNames $RemotePGName -MemberNames "nfstarget" -Allowed $False
```
Disallowing a target in a protection group is not supported for offload targets

## Update-Pfa2RemoteProtectionGroup
### Synopsis
Manage a remote protection group
### Syntax
```powershell

Update-Pfa2RemoteProtectionGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-On <String>] [-TargetRetention <RetentionPolicy>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | Returns a value of \\`true\\` if the remote protection group has been destroyed and is pending eradication. The \\`time\\_remaining\\` value displays the amount of time left until the destroyed remote protection group is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed remote protection group can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the remote protection group is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. For example, \\`targetName01\\`. | false | False | None |
| <nobr>TargetRetention</nobr> | none | The retention policy for the remote protection group. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2RemoteProtectionGroup -Array $Array -Name $RemotePGName -On "nfstarget" -Destroyed $True
```
Destroy the remote protection group $RemotePGName on the offload target "nfstarget"

**Example 2**
```powershell
Update-Pfa2RemoteProtectionGroup -Array $Array -Name $RemotePGName -On "nfstarget" -TargetRetention $policy
```
Update retention policy for offload target "nfstarget" for protection group $RemotePGName on FlashArray \\(See New-Pfa2RetentionPolicyObject\)

## Update-Pfa2RemoteProtectionGroupSnapshot
### Synopsis
Manage a remote protection group
### Syntax
```powershell

Update-Pfa2RemoteProtectionGroupSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Name <String>] [-On <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, destroys a resource. Once set to \\`true\\`, the \\`time\\_remaining\\` value will display the amount of time left until the destroyed resource is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed resource can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the resource is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>On</nobr> | none | Performs the operation on the target name specified. For example, \\`targetName01\\`. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2RemoteProtectionGroupSnapshot -Array $testarray -Name $PeergroupSnapshot -Destroyed $true -on $NFSTargetName
```
Destroy a remote protection group snapshot named $PeergroupSnapshot on remote target $NFSTargetName

## Update-Pfa2SmiS
### Synopsis
Modify SLP and SMI-S
### Syntax
```powershell

Update-Pfa2SmiS [-ApiVersion <String>] [-Array <Rest2Api>] [-SlpEnabled <Boolean>] [-WbemHttpsEnabled <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>SlpEnabled</nobr> | none | If set to \\`true\\`, the Service Location Protocol \\(SLP\) and its ports, TCP 427 and UDP 427, are enabled. | false | False | None |
| <nobr>WbemHttpsEnabled</nobr> | none | If set to \\`true\\`, the SMI-S provider and its port, TCP 5989 is enabled. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2SmiS -array $Array -WbemHttpsEnabled $false -SlpEnabled $false
```
Update SMI-S by disabling WbemHttps and Slp

## Update-Pfa2Subnet
### Synopsis
Modify subnet
### Syntax
```powershell

Update-Pfa2Subnet [-ApiVersion <String>] [-Array <Rest2Api>] [-Enabled <Boolean>] [-Gateway <String>] [-Mtu <Int32>] [-Name <String>] [-Prefix <String>] [-SubnetName <String>] [-Vlan <Int32>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Enabled</nobr> | none | Returns a value of \\`true\\` if subnet is enabled. Returns a value of \\`false\\` if subnet is disabled. If not specified, defaults to \\`true\\`. | false | False | None |
| <nobr>Gateway</nobr> | none | The IPv4 or IPv6 address of the gateway through which the specified subnet is to communicate with the network. | false | False | None |
| <nobr>Mtu</nobr> | none | Maximum message transfer unit \\(packet\) size for the subnet in bytes. MTU setting cannot exceed the MTU of the corresponding physical interface. If not specified, defaults to \\`1500\\`. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Prefix</nobr> | none | The IPv4 or IPv6 address to be associated with the specified subnet. | false | False | None |
| <nobr>SubnetName</nobr> | none | A user-specified name. The name must be locally unique and can be changed. | false | False | None |
| <nobr>Vlan</nobr> | none | VLAN ID number. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Subnet -Array $Array -Name $Name -Enabled $false -Vlan $Vlan
```
Find a subnet of FlashArray by name and update with specific parameters

## Update-Pfa2Support
### Synopsis
Create connection path
### Syntax
```powershell

Update-Pfa2Support [-ApiVersion <String>] [-Array <Rest2Api>] [-PhonehomeEnabled <Boolean>] [-Proxy <String>] [-RemoteAssistActive <Boolean>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>PhonehomeEnabled</nobr> | none | The status of phonehome. If set to \\`true\\`, enable phonehome. If set to \\`false\\`, disable phonehome. | false | False | None |
| <nobr>Proxy</nobr> | none | The value of the current proxy, which is used for connecting to cloud services such as phonehome, remote assist, etc. Specify the server name, including the scheme and proxy port number. | false | False | None |
| <nobr>RemoteAssistActive</nobr> | none | The status of a remote assist session. If set to \\`true\\`, enable the remote assist session. If set to \\`false\\`, disable the remote assist session. | false | False | None |
### Inputs
 - None

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Support -array $Array -PhonehomeEnabled $false -Proxy $proxy -RemoteAssistActive $false
```
Update a connection path by setting values of Proxy, PhonehomeEnabled, and RemoteAssistActive

## Update-Pfa2Volume
### Synopsis
Update a volume
### Syntax
```powershell

Update-Pfa2Volume [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-Pod <Reference>] [-Provisioned <Int64>] [-Qos <Qos>] [-RequestedPromotionState <String>] [-Truncate <Boolean>] [-VolumeGroup <Reference>] [-VolumeName <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, destroys a resource. Once set to \\`true\\`, the \\`time\\_remaining\\` value will display the amount of time left until the destroyed resource is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed resource can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the resource is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Pod</nobr> | none | Moves the volume into the specified pod. | false | False | None |
| <nobr>Provisioned</nobr> | none | Updates the virtual size of the volume. Measured in bytes. | false | False | None |
| <nobr>Qos</nobr> | none | Sets QoS limits. | false | False | None |
| <nobr>RequestedPromotionState</nobr> | none | Valid values are \\`promoted\\` and \\`demoted\\`. Patch \\`requested\\_promotion\\_state\\` to \\`demoted\\` to demote the volume so that the volume stops accepting write requests. Patch \\`requested\\_promotion\\_state\\` to \\`promoted\\` to promote the volume so that the volume starts accepting write requests. | false | False | None |
| <nobr>Truncate</nobr> | none | If set to \\`true\\`, reduces the size of a volume during a volume resize operation. When a volume is truncated, Purity automatically takes an undo snapshot, providing a 24-hour window during which the previous contents can be retrieved. After truncating a volume, its provisioned size can be subsequently increased, but the data in truncated sectors cannot be retrieved. If set to \\`false\\` or not set at all and the volume is being reduced in size, the volume copy operation fails. Required if the \\`provisioned\\` parameter is set to a volume size that is smaller than the original size. | false | False | None |
| <nobr>VolumeGroup</nobr> | none | Adds the volume to the specified volume group. | false | False | None |
| <nobr>VolumeName</nobr> | none | The new name for the resource. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2Volume -Array $Array -Destroyed $True -Name $vol.Name
```
Destroy a volume $vol.Name on FlashArray \\(Volume is not Eradicated, see Remove-Pfa2Volume\)

**Example 2**
```powershell
Update-Pfa2Volume -Array $Array -Name $_.Name -VolumeGroup $VolGroupRef
```
Remove a reference between volume $\\_.Name and volume group $VolGroupRef \\(See New-Pfa2ReferenceObject for creating a $VolGroupRef\)

**Example 3**
```powershell
Update-Pfa2Volume -Array $Array -Name $Volume.Name -Provisioned $NewSize -Truncate $True
```
Truncate a volume provisioned size on FlashArray

**Example 4**
```powershell
Update-Pfa2Volume -Array $Array -Name $Volume.Name -Provisioned $NewSize
```
Expand a volume provisioned size on FlashArray

## Update-Pfa2VolumeGroup
### Synopsis
Manage a volume group
### Syntax
```powershell

Update-Pfa2VolumeGroup [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-Qos <Qos>] [-VolumeGroupName <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | Returns a value of \\`true\\` if the volume group has been destroyed and is pending eradication. The \\`time\\_remaining\\` value displays the amount of time left until the destroyed volume group is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed volume group can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the volume group is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>Qos</nobr> | none | Qos bandwidth | false | False | None |
| <nobr>VolumeGroupName</nobr> | none | A user-specified name. The name must be locally unique and can be changed. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2VolumeGroup -Array $Array -Name $VolGroup.name -Destroyed $True
```
Destroy a volume group $VolGroup.Name. \\(Volume group  is not eradicated, see Remove-Pfa2VolumeGroup\)

**Example 2**
```powershell
Update-Pfa2VolumeGroup -Array $Array -Qos $qos -Name $VolumeGroup.Name
```
Find a volume group named $VolumeGroup.Name and update its Qos. Qos object could be created from New-Pfa2QosObject

## Update-Pfa2VolumeSnapshot
### Synopsis
Manage a volume snapshot
### Syntax
```powershell

Update-Pfa2VolumeSnapshot [-ApiVersion <String>] [-Array <Rest2Api>] [-Destroyed <Boolean>] [-Ids <System.Collections.Generic.List`1[System.String]>] [-Name <String>] [-VolumeSnapshotName <String>] [<CommonParameters>]




```
### Parameters
| Name  | Alias  | Description | Required? | Pipeline Input | Default Value |
| - | - | - | - | - | - |
| <nobr>ApiVersion</nobr> | none | alternative API version | false | False | None |
| <nobr>Array</nobr> | none | The PureArray object representing a connection to a Pure Storage FlashArray. Created using the \\`Connect-Pfa2Array\\` cmdlet. | false | False | None |
| <nobr>Destroyed</nobr> | none | If set to \\`true\\`, destroys a resource. Once set to \\`true\\`, the \\`time\\_remaining\\` value will display the amount of time left until the destroyed resource is permanently eradicated. Before the \\`time\\_remaining\\` period has elapsed, the destroyed resource can be recovered by setting \\`destroyed=false\\`. Once the \\`time\\_remaining\\` period has elapsed, the resource is permanently eradicated and can no longer be recovered. | false | False | None |
| <nobr>Ids</nobr> | none | Performs the operation on the unique resource IDs specified. Enter multiple resource IDs in comma-separated format. The \\`Ids\\` and \\`Name\\` parameters cannot be provided together. | false | False | None |
| <nobr>Name</nobr> | none | Performs the operation on the unique name specified. | false | True \\(ByPropertyName, ByValue\) | None |
| <nobr>VolumeSnapshotName</nobr> | none | The new name for the resource. | false | False | None |
### Inputs
 - System.String

### Outputs
 - System.Object

### Examples
**Example 1**
```powershell
Update-Pfa2VolumeSnapshot -Array $Array -Name $VolumeSnapshot.Name -VolumeSnapshotName $NewSuffix
```
Update a volume snapshot name to $NewSuffix on FlashArray

**Example 2**
```powershell
Update-Pfa2VolumeSnapshot -Array $Array -Destroyed $True -Name $VolumeSnapshot.Name
```
Destroy a volume snapshot for snapshot $VolumeSnapshot.Name

