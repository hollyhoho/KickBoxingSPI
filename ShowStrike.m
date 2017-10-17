function newFlag = ShowStrike(strikeThreshold, strike, flag)
        global picShow
        
        N = 3;
        
        upperFlag = flag(1);
        middleFlag = flag(2);
        lowerFlag = flag(3);
        left1Flag = flag(4);
        left2Flag = flag(5);
        right1Flag = flag(6);
        right2Flag = flag(7);
        
        strikeUpper = strike(1);
        strikeMiddle = strike(2);
        strikeLower = strike(3);
        strikeLeft1 = strike(4);
        strikeLeft2 = strike(5);
        strikeRight1 = strike(6);
        strikeRight2 = strike(7);
        
        picNone = picShow{1,1};   alpha_pic_none   = picShow{1,2};
        picUpper = picShow{2,1};  alpha_pic_upper  = picShow{2,2};
        picMiddle = picShow{3,1}; alpha_pic_middle = picShow{3,2};
        picLower = picShow{4,1};  alpha_pic_lower  = picShow{4,2};
        picLeft1 = picShow{5,1};  alpha_pic_left1  = picShow{5,2};
        picLeft2 = picShow{6,1};  alpha_pic_left2  = picShow{6,2};
        picRight1 = picShow{7,1}; alpha_pic_right1 = picShow{7,2};
        picRight2 = picShow{8,1}; alpha_pic_right2 = picShow{8,2};

 %%
        if upperFlag > 1
            upperFlag = upperFlag - 1;
        end
        if upperFlag == 1
            upperFlag = upperFlag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
        
        if lowerFlag > 1
            lowerFlag = lowerFlag - 1;
        end
        if lowerFlag == 1
            lowerFlag = lowerFlag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
        
        if middleFlag > 1
            middleFlag = middleFlag - 1;
        end
        if middleFlag == 1
            middleFlag = middleFlag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
        
        if left1Flag > 1
            left1Flag = left1Flag - 1;
        end
        if left1Flag == 1
            left1Flag = left1Flag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
        
        if left2Flag > 1
            left2Flag = left2Flag - 1;
        end 
        if left2Flag == 1
            left2Flag = left2Flag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end 
        
        if right2Flag > 1
            right2Flag = right2Flag - 1;
        end 
        if right2Flag == 1
            right2Flag = right2Flag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
        
        if right1Flag > 1
            right1Flag = right1Flag - 1;
        end
        if right1Flag == 1
            right1Flag = right1Flag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
    
%%        
        if strikeLeft1 > strikeThreshold
            if left1Flag == 0
                left1Flag = N;
                ShowStrikePosition(picLeft1, alpha_pic_left1);
            end           
        end 
        

        if strikeLeft2 > strikeThreshold
            if left2Flag == 0
                left2Flag = N;
                ShowStrikePosition(picLeft2, alpha_pic_left2);
            end 
        end      
        
        if strikeRight2 > strikeThreshold
            if right2Flag == 0
                right2Flag = N;
                ShowStrikePosition(picRight2, alpha_pic_right2);
            end 
        end
        
        if strikeRight1 > strikeThreshold
            if right1Flag == 0
                right1Flag = N;
                ShowStrikePosition(picRight1, alpha_pic_right1);
            end 
        end  
        
        if strikeUpper > strikeThreshold
            if upperFlag == 0
                upperFlag = N;
                ShowStrikePosition(picUpper, alpha_pic_upper);
            end 
        end
        
        if strikeLower > strikeThreshold
            if lowerFlag == 0
                lowerFlag = N;
                ShowStrikePosition(picLower, alpha_pic_lower);
            end 
        end
        
        if strikeMiddle > strikeThreshold
            if middleFlag == 0
                middleFlag = N;
                ShowStrikePosition(picMiddle, alpha_pic_middle);
            end 
        end
        
        newFlag = [upperFlag, lowerFlag, middleFlag,left1Flag, left2Flag, right1Flag, right2Flag];