#Rock, Paper, Scissors - Alex
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Base Window
$Form = New-Object system.Windows.Forms.Form
$Icon = New-Object system.drawing.icon ("\\stmartin.edu\dfs\users\Alexander.Simpson\Documents\WindowsPowerShell\Rock.ico")
$Form.Icon = $Icon
$Form.text = "Rock, Paper, Scissors"
$Form.name = "Rock, Paper, Scissors"
$Form.width = 650
$Form.Height = 485
$Form.MinimizeBox = $False
$Form.MaximizeBox = $False
$Form.WindowState = "Normal"
$Form.SizeGripStyle = "Hide"
$Form.startposition = "CenterScreen"

#Score Counters
$PScore = 0
$CScore = 0
$PScoreLabel = New-Object System.Windows.Forms.Label
$PScoreLabel.location = New-Object System.Drawing.Point(20, 0)
$PScoreLabel.text = ("Your Score:" + $PScore)
$CScoreLabel = New-Object System.Windows.Forms.Label
$CScoreLabel.location = New-Object System.Drawing.Point(20, 25)
$CScoreLabel.text = ("Opponent's Score:" + $CScore)
$form.controls.add($PScoreLabel)
$form.controls.add($CScoreLabel)


#Variable used to position initial buttons and associated labels
$i = 60
$w = 20

#Labels/Buttons creation
$RPS = @("Rock", "Paper", "Scissors") 
ForEach($Item in $RPS){
    $_ = $($Item)
    
    #Labels
    $_ = New-Object system.windows.forms.label
    $_.location = New-Object System.Drawing.Point($w, $i)
    $_.text = $_
    $_.name = $_
    $_.Autosize = $True
    $form.controls.add($_)
    if($i -ge $form.Height){ #Logic to create next row of buttons
        $i = 60
        $w *= 10
        }
    $i+=40

    #Buttons
    $_ = New-Object System.Windows.Forms.Button
    $_.location = New-Object System.Drawing.Point($w, $i)
    $_.text = $_
    $_.name = $_
    $form.controls.add($_)
    $i+=65

    #Click & pass object to play function
    $_.Add_Click({
    Play("Rock")
    })
}

    #Click Functionality (NEED TO GET ITEM TO PASS INTO FUNCTION)
Function Play($Choice){
    $ComputerChoice = $RPS[(Get-Random -Maximum 3)]
    Write-Host ("Your Opponent Picked: " +  $ComputerChoice)
    Write-Host ("You Picked: " + $Choice)
    
    #Compare user's choice and computer's choice for winner
    if($Choice -match $ComputerChoice){
        Write-Host "Tie!"}

    #Resolve Rock Choice
    If($Choice="Rock"){
        If($ComputerChoice="Paper"){
            Write-Host "Lose!"
            $CScore++
            }

        If($ComputerChoice="Scissors"){
            Write-Host "Win!"
            $PScore++
            }
     }
     
     #Resolve Paper Choice
     If($Choice="Paper"){
        If($ComputerChoice="Rock"){
            Write-Host "Win!"
            $PScore++
            }

        If($ComputerChoice="Scissors"){
            Write-Host "Lose!"
            $CScore++
            }
     }

     #Resolve Scissors Choice
     If($Choice="Scissors"){
        If($ComputerChoice="Rock"){
            Write-Host "Lose!"
            $CScore++
            }

        If($ComputerChoice="Paper"){
            Write-Host "Win!"
            $PScore++
            }
     }
}

#Execute
$Form.ShowDialog()