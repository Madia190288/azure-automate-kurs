
Param (
    [Parameter(HelpMessage = "URL til kortstokk", Mandatory =$false)]
    [string]
    $UrlKortstokk = 'http://nav-deckofcards.herokuapp.com/shuffle'
    )
    
    $webside = Invoke-WebRequest -Uri $UrlKortstokk
        
        $kortstokkJson = $webside.Content
    
    $kortstokk = ConvertFrom-Json -InputObject $kortstokkJson
   

    $poengKortstokk = 0

    foreach ($kort in $kortstokk) {    
        if ($kort.value -ceq 'J') {
            $poengKortstokk = $poengKortstokk + 10
        }
        elseif ($kort.value -ceq 'Q') {
            $poengKortstokk = $poengKortstokk + 10
        }
        elseif ($kort.value -ceq 'K') {
            $poengKortstokk = $poengKortstokk + 10
        }
        elseif ($kort.value -ceq 'A') {
            $poengKortstokk = $poengKortstokk + 11
        }
        elseif ($kort.value -eq '2') {
            $poengKortstokk = $poengKortstokk + 2
        }
        elseif ($kort.value -eq '3') {
            $poengKortstokk = $poengKortstokk + 3
        }
        elseif ($kort.value -eq '4') {
            $poengKortstokk = $poengKortstokk + 4
        }
        elseif ($kort.value -eq '5') {
            $poengKortstokk = $poengKortstokk + 5
        }
        elseif ($kort.value -eq '6') {
            $poengKortstokk = $poengKortstokk + 6
        }
        elseif ($kort.value -eq '7') {
            $poengKortstokk = $poengKortstokk + 7
        }
        elseif ($kort.value -eq '8') {
            $poengKortstokk = $poengKortstokk + 8
        }
        elseif ($kort.value -eq '9') {
            $poengKortstokk = $poengKortstokk + 9
        }
        elseif ($kort.value -eq '10') {
            $poengKortstokk = $poengKortstokk + 10
        }
        else {
            $poengKortstokk = 0
        }  
         
    }
    Write-Host 'Poengsummen er:' $poengKortstokk 
    
    
    function kortstokkprint {
        param (
            
            [Parameter()]
            [Object]
            $kortstokk
        )
        $kortstokktabell = @()

        foreach ($kort in $kortstokk) {
            $kortstokktabell += ($kort.suit[0] + $kort.value)
            
        }
        $kortstokktabell
        
    }
    


    Write-Host "Kortstokk: $(kortstokkprint($kortstokk))"


    $meg = $kortstokk[0..1]
    $kortstokk = $kortstokk[2..$kortstokk.Length]

    $magnus = $kortstokk[0..1]
    $kortstokk = $kortstokk[2..$kortstokk.Length]

    Write-Host "meg: $(kortstokkprint($meg))"
    Write-Host "meg: $(kortstokkprint($magnus))"
    Write-Host "meg: $(kortstokkprint($kortstokk))"

    
    
    