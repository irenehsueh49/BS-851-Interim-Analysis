/******************** Irene Hsueh's BS 851 Homework 10 ********************/

/* Part A */
title "Uneven Interim Analysis - Critical Values";
proc seqdesign 
errspend 						/* alpha spending = 2 * upper boundary value */
bscale=STDZ;					/* critical values on the Z-score scale */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.4 0.5 0.6667 0.8 1)	/* unequally spaced information levels */
method=errfuncobf 				/* O'Brien-Fleming type cumlative error spending function */
stop=reject						/* stop early only to reject H0 */
;
run;
title;

title "Uneven Interim Analysis - Significance Levels";
proc seqdesign 
errspend 						/* alpha spending = 2 * upper boundary value */
bscale=pvalue;					/* two-sided significance levels = 2 * lower boundary values */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.4 0.5 0.6667 0.8 1)	/* unequally spaced information levels */
method=errfuncobf 				/* O'Brien-Fleming type cumlative error spending function */
stop=reject						/* stop early only to reject H0 */
;
run;
title;




/* Part B */
title "Uneven Interim Analysis - Critical Values";
proc seqdesign 
errspend 							/* alpha spending = 2 * upper boundary value */
bscale=STDZ;						/* critical values on the Z-score scale */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3733 0.5 0.6667 0.8 1)	/* unequally spaced information levels */
method=errfuncobf 					/* O'Brien-Fleming type cumlative error spending function */
stop=reject							/* stop early only to reject H0 */
;
run;
title;

title "Uneven Interim Analysis - Significance Levels";
proc seqdesign 
errspend 							/* alpha spending = 2 * upper boundary value */
bscale=pvalue;						/* two-sided significance levels = 2 * lower boundary values */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3733 0.5 0.6667 0.8 1)		/* unequally spaced information levels */
method=errfuncobf 					/* O'Brien-Fleming type cumlative error spending function */
stop=reject							/* stop early only to reject H0 */
;
run;
title;




/* Part C */
title "Finding Alpha Spending Values";
proc seqdesign 
errspend 									/* alpha spending = 2 * upper boundary value */
bscale=STDZ;								/* critical values on the Z-score scale */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3111 0.4167 0.5556 0.6667 1)		/* unequally spaced information levels */
method=errfuncobf 							/* O'Brien-Fleming type cumlative error spending function */
stop=reject									/* stop early only to reject H0 */
;
run;
title;


title "Uneven Interim Analysis - Critical Values";
proc seqdesign 
errspend 												/* alpha spending = 2 * upper boundary value */
bscale=STDZ;											/* critical values on the Z-score scale */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3111 0.4167 0.5556 0.6667 1)					/* unequally spaced information levels */
method=errspend(0.00048 0.00306 0.01210 0.02442 0.05)	/* O'Brien-Fleming type cumlative error spending function */
stop=reject												/* stop early only to reject H0 */
;
run;
title;


title "Uneven Interim Analysis - Significance Levels";
proc seqdesign 
errspend 												/* alpha spending = 2 * upper boundary value */
bscale=pvalue;											/* two-sided significance levels = 2 * lower boundary values */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3111 0.4167 0.5556 0.6667 1)					/* unequally spaced information levels */
method=errspend(0.00048 0.00306 0.01210 0.02442 0.05)	/* O'Brien-Fleming type cumlative error spending function */
stop=reject												/* stop early only to reject H0 */
;
run;
title;




/* Part D */
title "Uneven Interim Analysis - Critical Values";
proc seqdesign 
errspend 												/* alpha spending = 2 * upper boundary value */
bscale=STDZ;											/* critical values on the Z-score scale */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3111 0.4567 0.5556 0.6667 1)					/* unequally spaced information levels */
method=errspend(0.00048 0.00306 0.01210 0.02442 0.05)	/* O'Brien-Fleming type cumlative error spending function */
stop=reject												/* stop early only to reject H0 */
;
run;
title;


title "Uneven Interim Analysis - Significance Levels";
proc seqdesign 
errspend 												/* alpha spending = 2 * upper boundary value */
bscale=pvalue;											/* two-sided significance levels = 2 * lower boundary values */
TwoSidedObrienFleming: 		
design nstages=5 alpha=0.05 alt=twosided 					
info=cum(0.3111 0.4567 0.5556 0.6667 1)					/* unequally spaced information levels */
method=errspend(0.00048 0.00306 0.01210 0.02442 0.05)	/* O'Brien-Fleming type cumlative error spending function */
stop=reject												/* stop early only to reject H0 */
;
run;
title;




/* Part E */
proc format;
	value $trt_format "T"="New Treatment" "C"=" Active Control";
	value outcome_format 0="No SVR" 1="SVR";
run;

data hepatitis;
	input trt$ outcome count;
	format trt $trt_format. outcome outcome_format.;
cards;
T 0 251
T 1 160
C 0 289
C 1 122
;
run;

proc print data=hepatitis label;
run;

title "Chi-Squared Test";
proc freq data=hepatitis order=internal;
	table trt*outcome / nocol nopercent chisq;
	weight count;
run;
title;





ODS HTML close;
ODS HTML;
