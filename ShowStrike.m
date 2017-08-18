function newFlag = ShowStrike(strikeThreshold, strike, flag, pic)
        
        N = 5;
        
        upperFlag = flag(1);
        lowerFlag = flag(2);
        left1Flag = flag(3);
        left2Flag = flag(4);
        left3Flag = flag(5);
        right1Flag = flag(6);
        right2Flag = flag(7);
        right3Flag = flag(8);
        
        strikeUpper = strike(1);
        strikeLower = strike(2);
        strikeLeft1 = strike(3);
        strikeLeft2 = strike(4);
        strikeLeft3 = strike(5);
        strikeRight1 = strike(6);
        strikeRight2 = strike(7);
        strikeRight3 = strike(8);
        
        picNone = pic{1,1};alpha_pic_none = pic{1,2};
        picUpper = pic{2,1};alpha_pic_upper = pic{2,2};
        picLower = pic{3,1};alpha_pic_lower = pic{3,2};
        picLeft1 = pic{4,1};alpha_pic_left1 = pic{4,2};
        picLeft2 = pic{5,1};alpha_pic_left2 = pic{5,2};
        picLeft3 = pic{6,1};alpha_pic_left3 = pic{6,2};
        picRight1 = pic{7,1};alpha_pic_right1 = pic{7,2};
        picRight2 = pic{8,1};alpha_pic_right2 = pic{8,2};
        picRight3 = pic{9,1};alpha_pic_right3 = pic{9,2};

 %%
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
        
        if left3Flag > 1
            left3Flag = left3Flag - 1;
        end
        if left3Flag == 1
            left3Flag = left3Flag - 1;
            ShowStrikePosition(picNone, alpha_pic_none);
        end
        
        if right3Flag > 1
            right3Flag = right3Flag - 1;
        end
        if right3Flag == 1
            right3Flag = right3Flag - 1;
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
        if strikeLeft3 > strikeThreshold
            if left3Flag == 0
                left3Flag = N;
                ShowStrikePosition(picLeft3, alpha_pic_left3);
            end 
        end       
        if strikeRight3 > strikeThreshold
            if right3Flag == 0
                right3Flag = N;
                ShowStrikePosition(picRight3, alpha_pic_right3);
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
        
        newFlag = [upperFlag, lowerFlag, left1Flag, left2Flag, left3Flag, right1Flag, right2Flag, right3Flag];