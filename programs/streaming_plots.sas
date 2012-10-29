ods graphics / width=1000 height=500 imagemap;

title "Minutes streamed per day";
proc sgplot data=work.DailySummary;
	scatter x=date y=minutesviewedperday;
	refline '25Mar2010'd / axis=x label="Wii disc available";
	xaxis minor label="Date";
	yaxis label="Minutes viewed in a day";
run;

title "Minutes streamed per month";
proc sgplot data=work.MonthlyMinutes;
needle x=date y=count;
refline '25Mar2010'd / axis=x label="Wii disc available";
xaxis minor label="Month/Year";
yaxis label="Minutes streamed in a month";
run;

title "Titles streamed per month";
proc sgplot data=work.titlespermonth;
vbar date / stat=freq freq=count;
refline "Apr2010" / axis=x label="Wii disc available";
xaxis minor fitpolicy=rotatethin label="Month/Year";
yaxis label="Number of titles";
run;

title "Minutes streamed per month since April 2010";
proc sgplot data=work.MonthlyMinutes(where=(date>'01Apr2010'd));
vbar date /response=count;
xaxis minor label="Month/Year";
yaxis label="Minutes streamed in month";
run;

title "Percent utilization";
proc sgplot data=work.Utilization(where=(date<'01Oct2011'd));
loess x=date y=utilization /legendlabel="Loess (smoothing)";
refline '25Mar2010'd / axis=x label="Wii disc available";
xaxis minor label="Month/Year";
yaxis label="Percentage of available minutes";
run;


title "Percent utilization";
proc sgplot data=work.Utilization(where=(date<'01Oct2011'd));
loess x=date y=utilization /legendlabel="Loess (smoothing)";
format utilization percent6.0;
refline '25Mar2010'd / axis=x label="Wii disc available";
xaxis minor label="Month/Year";
yaxis label="Percentage of available minutes" max=1;
run;



