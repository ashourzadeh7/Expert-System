(defrule Menu
=>
(printout t crlf crlf
" AN Expert System for Diagnosing Symptoms of COVID-19 coronavirus" crlf
"           ==================================" crlf
"            Written By  M.Ashourzadeh  &  H.Rafiei" crlf crlf
" ==========================================================" crlf
" Call emergency now if you have any life threatening symptoms:" crlf crlf
" - Severe breathing problems (e.g. can't talk normally, turning blue and gasping)" crlf crlf
" - Chest pain (e.g. like a tight band or heavy weight in or around the chest)" crlf crlf
" - Stroke (e.g. unable to raise arm, one sided limb weakness or drooping face)" crlf crlf
" - Severe injury/heavy bleeding that cannot be stopped" crlf crlf
" - Fitting now/unconscious (e.g. cannot be woken)" crlf
" ==========================================================" crlf crlf
" Enter (1) to continue: ")
(assert (continue (read))))
;;----------------------------R1
(defrule R1
(continue 1)
=>
(printout t crlf crlf crlf " Is the person you are concerned about under 16 years of age?" crlf crlf
" 1) Yes" crlf crlf
" 2) No" crlf crlf
" Your answer: " )
(assert (Q1 (read))))
;;----------------------------R2:Q1Yes
(defrule R2
(Q1 1)
=>
(printout t crlf crlf crlf " Contact GP today - The answers given suggest that you should contact your GP/surgery within the next 6 hours." crlf crlf
" Recommend:" crlf
" If the symptoms change or worsen in any way, please call emergency." crlf crlf
" ========== END ==========" crlf))
;;----------------------------R3:Q1No
(defrule R3
(Q1 2)
=>
(printout t crlf crlf crlf " Have any of these symptoms developed A high temperature fever or A new continuous cough?" crlf crlf
" 1) Yes" crlf crlf
" 2) No" crlf crlf
" Your answer: " )
(assert (Q2 (read))))
;;----------------------------R4:Q1No_Q2Yes
(defrule R4
(Q1 2)
(Q2 1)
=>
(printout t crlf crlf crlf " Are you so breathless that you are unable to speak more than a few words?" crlf crlf
" 1) Yes" crlf crlf
" 2) No" crlf crlf
" Your answer: " )
(assert (Q4 (read))))
;;----------------------------R5:Q1No_Q2No
(defrule R5
(or(and(Q1 2)(Q2 2))
(and(Q1 2)(Q2 1)(Q4 2)(Q5 2)))
=>
(printout t crlf crlf crlf " Are you at an increased risk of a severe illness from the coronavirus COVID 19?" crlf crlf
" 1) Yes" crlf crlf
" 2) No" crlf crlf
" Your answer: " )
(assert (Q3 (read))))
;;----------------------------R6:Q1No_Q2No_Q3Yes
(defrule R6
(or(and(Q1 2)(Q2 2)(Q3 1))
(and(Q1 2)(Q2 1)(Q4 2)(Q5 2)(Q3 1)))
=>
(printout t crlf crlf crlf " Self Care - You do not need to speak to anybody right now as you: do not have a high temperature do not have a continuous cough It is unlikely that you are currently experiencing symptoms of the coronavirus (COVID-19) infection." crlf crlf
" Recommend:" crlf
" If you develop symptoms during home isolation, you should re-use the expert system symptom to check your symptoms." crlf crlf
" ========== END ==========" crlf))
;;----------------------------R7:Q1No_Q2No_Q3No
(defrule R7
(or(and(Q1 2)(Q2 2)(Q3 2))
(and(Q1 2)(Q2 1)(Q4 2)(Q5 2)(Q3 2)))
=>
(printout t crlf crlf crlf " Do you live with other people?" crlf crlf
" 1) Yes" crlf crlf
" 2) No" crlf crlf
" Your answer: " )
(assert (Q6 (read))))
;;----------------------------R8:Q1No_Q2Yes_Q4Yes
(defrule R8
(Q1 2)
(Q2 1)
(Q4 1)
=>
(printout t crlf crlf crlf " Call emergency for further health advice." crlf crlf
" Recommend:" crlf
" Do not eat or drink until you have spoken to the ambulance service." crlf crlf
" ========== END ==========" crlf))
;;----------------------------R9:Q1No_Q2Yes_Q4No
(defrule R9
(Q1 2)
(Q2 1)
(Q4 2)
=>
(printout t crlf crlf crlf " Are you so ill that you've stopped doing all of your usual daily activities?" crlf crlf
" 1) Yes" crlf crlf
" 2) No" crlf crlf
" Your answer: " )
(assert (Q5 (read))))
;;----------------------------R10:Q1No_Q2Yes_Q4No_Q5Yes
(defrule R10
(Q1 2)
(Q2 1)
(Q4 2)
(Q5 1)
=>
(printout t crlf crlf crlf " Your answers indicate that you may be at risk of developing a Coronavirus (COVID-19) infection." crlf
" Please call the emergency number now and let them know." crlf crlf
" Recommend:" crlf
" Please do not attend doctor, pharmacy, accident or emergency surgery. To help reduce the risk of infection spreading, you need:" crlf
" If you go out, go home right away." crlf
" If you use public transportation, stay as far away from other people as possible and go home in the most direct way." crlf
" Keep at least 2 meters (about 3 steps) away from people if you can." crlf
" At home, stay alone (self-isolating) in a room where the door can be closed." crlf
" Avoid touching surfaces or objects that are shared with others." crlf
" If symptoms worsen during isolation at home, you should call the emergency number again." crlf
" You do not need to get a note from a general practitioner." crlf crlf
" ========== END ==========" crlf))
;;----------------------------R11:Q1No_Q2No_Q3No_Q6Yes
(defrule R11
(or(and(Q1 2)(Q2 2)(Q3 2)(Q6 1))
(and(Q1 2)(Q2 1)(Q4 2)(Q5 2)(Q3 2)(Q6 1)))
=>
(printout t crlf crlf crlf " Self care with isolation To help protect others and avoid spreading infection." crlf
" If you live with others and you are the first in the household to have symptoms of coronavirus, then you must stay at home for 7 days, but all other household members that remain well must stay at home and not leave the house for 14 days. The 14 day period starts from the day when the first person in the household became ill. See this explanatory diagram for further guidance on household isolation." crlf
" You do not need to stay at home if you just have a cough after 7 days. A cough can last for several weeks after the infection has gone." crlf
" To help protect others and lower the risk of spreading the infection, you need to:" crlf
" If out, go home immediately." crlf
" If using public transport, stay as far away as possible from other people and go home by the most direct route." crlf
" Stay at least 2 metres (about 3 steps) away from people if you can." crlf
" At home, remain alone (self-isolate) in a room where the door can be kept shut." crlf
" Avoid touching surfaces or objects that are shared with other people." crlf
" PLEASE DO NOT ATTEND YOUR GP SURGERY, PHARMACY OR ACCIDENT AND EMERGENCY." crlf crlf
" Recommend:" crlf
" How to look after your symptoms at home rest and drink plenty of fluids" crlf
" take paracetamol as prescribed on the packaging unless you have any underlying condition that prevents you from doing so" crlf
" cover the mouth with a tissue when coughing or sneezing" crlf
" put used tissues in a bin" crlf
" wash your hands regularly with warm water and soap for at least 20 seconds" crlf
" Vulnerable/at risk groups" crlf
" Some people are more vulnerable to self-limiting illnesses (like viruses) for example:" crlf
" have had an organ transplant" crlf
" are having certain types of cancer treatment" crlf
" have blood or bone marrow cancer, such as leukaemia" crlf
" have a severe lung condition, such as cystic fibrosis, COPD or severe asthma" crlf
" have a condition that makes you much more likely to get infections" crlf
" are taking medicine that weakens your immune system" crlf
" are over 70 years of age" crlf
" Diabetes are pregnant and have a serious heart condition" crlf
" If you can, move any vulnerable people (the elderly and those with underlying conditions) out of your home, for the whole" crlf
" isolation period. If you cannot do this, stay away from vulnerable people as much as possible." crlf
" For further information on staying at home, click here." crlf
" For further information on ending isolation click here." crlf
" Get an isolation note to give to your employer" crlf
" You can send an isolation note to your employer as proof you need to stay off work because of coronavirus." crlf
" You do not need to get a note from a GP." crlf crlf
" ========== END ==========" crlf))
;;----------------------------R12:Q1No_Q2No_Q3No_Q6No
(defrule R12
(or(and(Q1 2)(Q2 2)(Q3 2)(Q6 2))
(and(Q1 2)(Q2 1)(Q4 2)(Q5 2)(Q3 2)(Q6 2)))
=>
(printout t crlf crlf crlf " Self Care and isolation - If you live alone and you have symptoms of coronavirus (COVID-19), however mild, stay at home for 7 days from when your symptoms started." crlf
" You need to self-isolate (stay away) from other people for 7 days from when your symptoms started, or until your symptoms have gone. You do not need to stay at home if you just have a cough after 7 days. A cough can last for several weeks after the infection has gone." crlf
" To help protect others and lower the risk of spreading the infection, you need to:" crlf
" If out, go home immediately." crlf
" If using public transport, stay as far away as possible from other people and go home by the most direct route." crlf
" Stay at least 2 metres (about 3 steps) away from people if you can." crlf
" At home, remain alone (self-isolate) in a room where the door can be kept shut." crlf
" Avoid touching surfaces or objects that are shared with other people." crlf
" PLEASE DO NOT ATTEND YOUR GP SURGERY, PHARMACY OR ACCIDENT AND EMERGENCY." crlf
" You do not need to call emergency to go into self-isolation. If your symptoms worsen during home isolation, you should call emergency." crlf crlf
" Recommend:" crlf
" How to look after your symptoms at home:" crlf
" rest and drink plenty of fluids" crlf
" take paracetamol as prescribed on the packaging unless you have any underlying condition that prevents you from doing so" crlf
" cover the mouth with a tissue when coughing or sneezing" crlf
" put used tissues in a bin wash your hands regularly with warm water and soap for at least 20 seconds" crlf
" For further information on staying at home, click here." crlf
" For further information on ending isolation click here." crlf
" Get an isolation note to give to your employer" crlf
" You can send an isolation note to your employer as proof you need to stay off work because of coronavirus." crlf
" You do not need to get a note from a GP." crlf crlf
" ========== END ==========" crlf))