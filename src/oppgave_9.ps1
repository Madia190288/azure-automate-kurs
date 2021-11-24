
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
            $kortstokk
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

    Write-Host "Kortstokk: $(kortstokkprint($kortstokk))"
    Write-Host "Poengsummen: $(kortsum($kortstokk))"


    $meg = $kortstokk[0..1]
    $kortstokk = $kortstokk[2..$kortstokk.Length]
    $magnus = $kortstokk[0..1]
    $kortstokk = $kortstokk[2..$kortstokk.Length]
    
    function skrivutResultat {
        param (
            # Parameter help description
            [Parameter()]
            [Object]
            $meg,
            # Parameter help description
            [Parameter()]
            [Object]
            $magnus,
            [string]
            $vinner
        )

        Write-Output "Vinneren er: $vinner"
        Write-Output "magnus | $(kortsum($magnus)) | $(kortstokkprint($magnus))"    
        Write-Output "meg    | $(kortsum($meg)) | $(kortstokkprint($meg))"

    }

    $blackjack = 21

    if ($(kortsum($meg)) -eq $blackjack) {

        skrivutResultat -vinner "meg" -magnus $magnus -meg $meg
        

    }
    elseif ($(kortsum($magnus)) -eq $blackjack) {
        skrivutResultat -vinner "magnus" -meg $meg -magnus $magnus
        
    }
    elseif ($(kortsum($magnus)) -and $(kortsum($meg)) -eq $blackjack) {

        skrivutResultat -vinner "ingen-draw" -meg $meg -magnus $magnus
        
    }


   
   #skrivutResultat $meg $magnus $vinner


   while ($(kortsum($meg)) -lt 17) {
    $meg += $kortstokk[0]
    $kortstokk = $kortstokk[1..$kortstokk.Count]
}

if ($(kortsum($meg)) -gt $blackjack) {
    skrivutResultat -vinner "magnus" -magnus $magnus -meg $meg
    exit
}

#oppgave9

while ($(kortsum($magnus)) -le $(kortsum($meg)))
{
    $magnus += $kortstokk[0]
    $kortstokk = $kortstokk[1..$kortstokk.Count]
}

### Magnus taper spillet dersom poengsummen er høyere enn 21
if ($(kortsum($magnus)) -gt $blackjack) {
    skrivutResultat -vinner "meg" -magnus $magnus -meg $meg
    exit
}


    
    
    