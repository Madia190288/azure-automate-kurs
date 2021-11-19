
Param (
    [Parameter(HelpMessage = "URL til kortstokk", Mandatory =$false)]
    [string]
    $UrlKortstokk = 'http://nav-deckofcards.herokuapp.com/shuffle'
    )
    
    $webside = Invoke-WebRequest -Uri $UrlKortstokk
        
        $kortstokkJson = $webside.Content
    
    $kortstokk = ConvertFrom-Json -InputObject $kortstokkJson
   

    function kortsum {
        param (
            [Parameter()]
            [Object[]]
            $kort
        )
        $poengKortstokk = 0
        foreach ($kort in $kortstokk) {
            $poengKortstokk += switch ($kort.value) {
                'J' { 10 }
                'Q' { 10 }
                'K' { 10 }
                'A' { 11 }
                Default { $kort.value }
            }
        }
        $poengKortstokk
    }
    
    
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
    
    function skrivutResultat {
        param (
            # Parameter help description
            [Parameter()]
            [System.Object]
            $meg,
            # Parameter help description
            [Parameter()]
            [System.Object]
            $magnus
        )

        $poengtilmeg = kortsum($meg)
        $poengtilmagnus = kortsum($magnus)

        if ($poengtilmeg -eq 21) {
            Write-Host "Vinneren er: Meg"
            Write-Host "Magnus | $poengtilmagnus | $(kortstokkprint($magnus))"
            Write-Host "Meg | $poengtilmeg | $(kortstokkprint($meg))"
        }
        elseif ($poengtilmagnus -eq 21) {
            Write-Host "Vinneren er: Magnus"
            Write-Host "Magnus | $poengtilmagnus | $(kortstokkprint($magnus))"
            Write-Host "Meg | $poengtilmeg | $(kortstokkprint($meg))"
            
        }
        elseif ($poengtilmeg -eq 21 -and $poengtilmagnus -eq 21) {
            Write-Host "Spillet uavgjort"
            Write-Host "Magnus | $poengtilmagnus | $(kortstokkprint($magnus))"
            Write-Host "Meg | $poengtilmeg | $(kortstokkprint($meg))"

        }
        else {
            Write-Host "Ukjent resultat"
        }

    }


    Write-Host "Kortstokk: $(kortstokkprint($kortstokk))"
    Write-Host "Poengsummen: $(kortsum($kort))"


    $meg = $kortstokk[0..1]
    $kortstokk = $kortstokk[2..$kortstokk.Length]
    $magnus = $kortstokk[0..1]
    $kortstokk = $kortstokk[2..$kortstokk.Length]

    #Write-Host "meg: $(kortstokkprint($meg))"
    #Write-Host "meg: $(kortstokkprint($magnus))"
    #Write-Host "meg: $(kortstokkprint($kortstokk))"

    skrivutResultat $meg $magnus

    
    
    