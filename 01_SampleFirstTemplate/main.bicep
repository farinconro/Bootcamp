
param location string = 'westus3'

@maxLength(24)
param storageAccountName string = 'miprimerstorage${uniqueString(resourceGroup().id)}'

@allowed([
  'dev'
  'prd'
])
param environmentType string

var storageAccountSkuName = (environmentType == 'prd') ? 'Standard_GRS' : 'Standard_LRS'

resource exampleStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
}

output appServiceAppHostName string = exampleStorage.properties.primaryEndpoints.blob
