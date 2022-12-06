        --> 131:6
              |
          131 |     (expression ~ LBrack ~ expression? ~ RBrack)␊
              |      ^--------^
              |
              = rule expression is left-recursive (expression -> expression); pest::prec_climber might be useful in this case
    

