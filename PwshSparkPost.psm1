
Set-StrictMode -Version Latest

Get-ChildItem -Path "$PSScriptRoot\functions" -Filter '*.ps1' -Recurse | ForEach-Object {
    . $_.FullName
    Export-ModuleMember -Function $_.BaseName
}

Get-ChildItem -Path "$PSScriptRoot\internal" -Filter '*.ps1' -Recurse | ForEach-Object {
    . $_.FullName
}

$Script:NotConnectedMessage = 'No connection supplied or stored. Please either call `Connect-SparkPost` or call `Get-SparkPostConnection` and pass the result to all additional calls.'
$Script:InvalidConnection = 'Provided connection is invalid.'
