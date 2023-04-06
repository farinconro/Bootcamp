# Bootcamp
Samples about Bicep templates for Arroyo Bootcamp

Prerequisites

1. Visual Code
2. Bicep Extension for Visual Code
3. Azure CLI or Azure Powershell installed
4. Bicep CLI Installed

Use the next Azure Powershell commands to deploy the templates

1. Login in Azure
```powershell
Connect-AzAccount
```

2. Set the template path
```powershell
Set-Location -Path <templatePath>
```

3. Get Subscription information to use as context, we use the context to indicate to Powershell where (in which subscription) you want to deploy the template-resources
```powershell
$context = Get-AzSubscription -SubscriptionName 'SuscriptionName'
```

4. Set Context
```powershell
Set-AzContext $context
```
5. Create ResourceGroup from console
```powershell
New-AzResourceGroup -Name <ResourceGroupName> -Location "AzureLocation"
```
6. With this command you can set specific Resource Group as default, in this way you can skip this parameter in the template deployment
```powershell
Set-AzDefault –ResourceGroupName <ResourceGroupName>
```

7.1 Deploy Bicep template - main command (without any parameter)
```powershell
New-AzResourceGroupDeployment –TemplateFile <TemplateFileName.bicep>
```

7.2 Deploy Bicep template - Setting parameters values
```powershell
New-AzResourceGroupDeployment `
  -TemplateFile main.bicep `
  -environmentType nonprod `
  -param2 valueParam2
```

7.3 Deploy Bicep template - using parameters template
```powershell
New-AzResourceGroupDeployment `
  -TemplateFile main.bicep `
  -TemplateParameterFile main.parameters.json
```
