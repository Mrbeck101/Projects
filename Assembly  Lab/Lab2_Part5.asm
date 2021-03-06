       ; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point




ROMStart:  		  EQU  $4000  

SIZE:           EQU  10 
            ORG $1000
count:    DS.B 1
bits: DC.W 2
            ORG   $4000
Entry:
_Startup:
          CLR  count          
          LDX  #NUMS
          
  More:   
          LDAA 1,X+
          STAA bits
          BCLR bits,%01100111
          BNE SKIP
          INC count          
   SKIP:
          CPX #(NUMS+SIZE)              
          BNE More
                           
L:      BRA L


NUMS: DC.B %01100111,%01111111,%01100000,%01101111,%01100111
              DC.B %01100111,%01101111,%01100111,%01100111,%01101111

   
      
                                                                                         




;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
