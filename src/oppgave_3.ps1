$webside = Invoke-WebRequest -Uri "http://nav-deckofcards.herokuapp.com/shuffle"
# Write-Host $webside

#$kort = "[{"suit":"CLUBS","value":"7"},{"suit":"SPADES","value":"10"},{"suit":"DIAMONDS","value":"A"},{"suit":"DIAMONDS","value":"4"},{"suit":"DIAMONDS","value":"7"},{"suit":"DIAMONDS","value":"3"},{"suit":"SPADES","value":"J"},{"suit":"CLUBS","value":"Q"},{"suit":"CLUBS","value":"K"},{"suit":"CLUBS","value":"4"},{"suit":"CLUBS","value":"6"},{"suit":"DIAMONDS","value":"6"},{"suit":"HEARTS","value":"K"},{"suit":"CLUBS","value":"5"},{"suit":"HEARTS","value":"9"},{"suit":"CLUBS","value":"A"},{"suit":"HEARTS","value":"10"},{"suit":"DIAMONDS","value":"9"},{"suit":"HEARTS","value":"5"},{"suit":"CLUBS","value":"10"},{"suit":"HEARTS","value":"Q"},{"suit":"SPADES","value":"5"},{"suit":"HEARTS","value":"7"},{"suit":"SPADES","value":"K"},{"suit":"HEARTS","value":"2"},{"suit":"HEARTS","value":"6"},{"suit":"HEARTS","value":"8"},{"suit":"HEARTS","value":"3"},{"suit":"CLUBS","value":"2"},{"suit":"CLUBS","value":"8"},{"suit":"DIAMONDS","value":"10"},{"suit":"SPADES","value":"4"},{"suit":"CLUBS","value":"3"},{"suit":"SPADES","value":"A"},{"suit":"SPADES","value":"9"},{"suit":"HEARTS","value":"A"},{"suit":"CLUBS","value":"J"},{"suit":"HEARTS","value":"4"},{"suit":"SPADES","value":"Q"},{"suit":"SPADES","value":"2"},{"suit":"SPADES","value":"6"},{"suit":"DIAMONDS","value":"5"},{"suit":"DIAMONDS","value":"8"},{"suit":"DIAMONDS","value":"Q"},{"suit":"SPADES","value":"8"},{"suit":"CLUBS","value":"9"},{"suit":"HEARTS","value":"J"},{"suit":"SPADES","value":"3"},{"suit":"DIAMONDS","value":"J"},{"suit":"DIAMONDS","value":"2"},{"suit":"DIAMONDS","value":"K"},{"suit":"SPADES","value":"7"}])"

$kortstokkJson = $webside.Content



$kortstokk = ConvertFrom-Json -InputObject $kortstokkJson


$kortstokktabell = @()

foreach ($kort in $kortstokk) {
    $kortstokktabell += $kort.suit[0] + $kort.value
    
}
Write-Host "Kortstokk:" $kortstokktabell


