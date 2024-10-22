# Import the Azure module
Import-Module Az

# Define variables
$resourceGroupName = "example-resources"
$location = "eastus" # Change this to your desired location
$storageAccountName = "examplestorageacct" # Change this to your desired storage account name
$skuName = "Standard_LRS" # Change this to your desired SKU

# Authenticate to Azure
Connect-AzAccount

# Create the resource group if it doesn't exist
if (-Not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                     -Name $storageAccountName `
                     -Location $location `
                     -SkuName $skuName `
                     -Kind "StorageV2" `
                     -EnableHttpsTrafficOnly $true