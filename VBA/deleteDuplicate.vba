    Dim i As Integer
    Dim j As Integer
    
    i = 2
    
    
    While Range("H" + CStr(i)).Value <> Empty
        j = 588
        While Range("H" + CStr(j)).Value <> Range("H" + CStr(i)).Value And Range("H" + CStr(j)) <> Empty
            j = j + 1
        Wend
        
        If Range("H" + CStr(j)) <> Empty Then
            Range("H" + CStr(j)).EntireRow.Delete Shift:=xlUp
        Else
            i = i + 1
        End If
    Wend
        
