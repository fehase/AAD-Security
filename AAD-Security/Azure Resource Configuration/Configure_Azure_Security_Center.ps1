Set-AzContext -Subscription "$subscriptionid"
Register-AzResourceProvider -ProviderNamespace 'Microsoft.Security'

Set-AzSecurityPricing -Name "default" -PricingTier "Standard"
Set-AzSecurityWorkspaceSetting -Name "default" -Scope
"/subscriptions/$subscriptionid" -WorkspaceId"/subscriptions/$subscriptionid/resourceGroups/myRg/providers/Microsoft.OperationalInsights/workspaces/myWorkspace"
Set-AzContext -Subscription "$subscriptionid"

Set-AzSecurityAutoProvisioningSetting -Name "default" -EnableAutoProvision

Set-AzSecurityContact -Name "default1" -Email "destsec@outlook.com" -Phone "4254248888" -AlertAdmin -NotifyOnAlert

Register-AzResourceProvider -ProviderNamespace 'Microsoft.PolicyInsights'
$Policy = Get-AzPolicySetDefinition | where {$_.Properties.displayName -EQ '[Preview]: Enable Monitoring in Azure Security Center'}
New-AzPolicyAssignment -Name 'ASC Default <$subscriptionid>' -DisplayName 'Security Center Default <subscription ID>' -PolicySetDefinition $Policy -Scope '/subscriptions/$subscriptionid'
