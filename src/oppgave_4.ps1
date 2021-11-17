
Param (
[Parameter(HelpMessage = "URL til kortstokk", Mandatory =$false)]
[string]
$UrlKortstokk = 'http://nav-deckofcards.herokuapp.com/shuffle'
)

$webside = Invoke-WebRequest -Uri $UrlKortstokk
    
    $kortstokkJson = $webside.Content

$kortstokk = ConvertFrom-Json -InputObject $kortstokkJson

$kortstokktabell = @()

foreach ($kort in $kortstokk) {
    $kortstokktabell += $kort.suit[0] + $kort.value
    
}
Write-Host "Kortstokk:" $kortstokktabell



