Sub PurchasePrice()
'
' GoalSeek Macro
'
    ' Adjust GoalSeek Goal:= Value to AROI desired. 
    Range("G14").GoalSeek Goal:=0.1, ChangingCell:=Range("B4")
    Range("A1").Select
'
' RoundUp Macro
'
    Range("B14").Select
    ActiveCell.FormulaR1C1 = "=ROUNDUP(R[-10]C,-3)"
    Range("B14").Select
    Selection.Copy
    Range("B4").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Range("B14").Select
    ActiveCell.FormulaR1C1 = ""
    Range("A1").Select
End Sub