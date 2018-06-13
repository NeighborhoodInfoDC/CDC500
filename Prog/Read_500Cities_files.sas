/**************************************************************************
 Program:  Read_500Cities_files
 Library:  CDC500
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  6/6/2018
 Version:  SAS 9.4
 Environment:  Windows
 Modifications: 
 Read in CDC 500 raw data and generate SE variables
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas"; 

** Define libraries **;
%DCData_lib( CDC500 )
libname raw "L:\Libraries\CDC500\Raw";


** Import raw data **;
proc import datafile="L:\Libraries\CDC500\Raw\500cities_raw.csv"
   out=CDC500_2017raw
   dbms=csv
   replace;
   getnames=yes;
run;


** Cleanup raw data & convert MOEs **;
data CDC500_2017;
   set CDC500_2017raw;

   ** Create GEO2010 **;
   geo2010 = put(TractFIPS,z11.);
  
   ** Take the bottom number of confidence interval, convert to numeric **;
   LowACCESS2_Crude95CI= scan(ACCESS2_Crude95CI, 1, '(,') + 0;
   LowARTHRITIS_Crude95CI= scan(ARTHRITIS_Crude95CI, 1,'(,') + 0;
   LowBINGE_Crude95CI = scan(BINGE_Crude95CI, 1,'(,') + 0;
   LowBPHIGH_Crude95CI= scan(BPHIGH_Crude95CI , 1,'(,') + 0;
   LowBPMED_Crude95CI= scan(BPMED_Crude95CI , 1,'(,') + 0;
   LowCANCER_Crude95CI= scan(CANCER_Crude95CI , 1,'(,') + 0;
   LowCASTHMA_Crude95CI= scan(CASTHMA_Crude95CI , 1,'(,') + 0;
   LowCHD_Crude95CI= scan(CHD_Crude95CI , 1,'(,') + 0;
   LowCHECKUP_Crude95CI= scan(CHECKUP_Crude95CI , 1,'(,') + 0;
   LowCHOLSCREEN_Crude95CI= scan(CHOLSCREEN_Crude95CI , 1,'(,') + 0;
   LowCOLON_SCREEN_Crude95CI= scan(COLON_SCREEN_Crude95CI , 1,'(,') + 0;
   LowCOPD_Crude95CI= scan(COPD_Crude95CI , 1,'(,') + 0;
   LowCOREM_Crude95CI= scan(COREM_Crude95CI , 1,'(,') + 0;
   LowCOREW_Crude95CI= scan(COREW_Crude95CI , 1,'(,') + 0;
   LowCSMOKING_Crude95CI= scan(CSMOKING_Crude95CI , 1,'(,') + 0;
   LowDENTAL_Crude95CI= scan(DENTAL_Crude95CI , 1,'(,') + 0;
   LowDIABETES_Crude95CI= scan(DIABETES_Crude95CI , 1,'(,') + 0;
   LowHIGHCHOL_Crude95CI= scan(HIGHCHOL_Crude95CI , 1,'(,') + 0;
   LowKIDNEY_Crude95CI= scan(KIDNEY_Crude95CI , 1,'(,') + 0;
   LowLPA_Crude95CI= scan(LPA_Crude95CI , 1,'(,') + 0;
   LowMAMMOUSE_Crude95CI= scan(MAMMOUSE_Crude95CI , 1,'(,') + 0;
   LowMHLTH_Crude95CI= scan(MHLTH_Crude95CI , 1,'(,') + 0;
   LowOBESITY_Crude95CI= scan(OBESITY_Crude95CI , 1,'(,') + 0;
   LowPAPTEST_Crude95CI= scan(PAPTEST_Crude95CI , 1,'(,') + 0;
   LowPHLTH_Crude95CI= scan(PHLTH_Crude95CI , 1,'(,') + 0;
   LowSLEEP_Crude95CI= scan(SLEEP_Crude95CI , 1,'(,') + 0;
   LowSTROKE_Crude95CI= scan(STROKE_Crude95CI , 1,'(,') + 0;
   LowTEETHLOST_Crude95CI= scan(TEETHLOST_Crude95CI , 1,'(,') + 0;


   ** Create MOE by subtracting CI from estimate **;
   ACCESS2_CrudePrev_MOE=ACCESS2_CrudePrev-LowACCESS2_Crude95CI;
   ARTHRITIS_CrudePrev_MOE= ARTHRITIS_CrudePrev-LowARTHRITIS_Crude95CI; 
   BINGE_CrudePrev_MOE=BINGE_CrudePrev - LowBINGE_Crude95CI;
   BPHIGH_CrudePrev_MOE=BPHIGH_CrudePrev - LowBPHIGH_Crude95CI;
   BPMED_CrudePrev_MOE=BPMED_CrudePrev - LowBPMED_Crude95CI;
   CANCER_CrudePrev_MOE=CANCER_CrudePrev - LowCANCER_Crude95CI;
   CASTHMA_CrudePrev_MOE=CASTHMA_CrudePrev - LowCASTHMA_Crude95CI;
   CHD_CrudePrev_MOE=CHD_CrudePrev - LowCHD_Crude95CI;
   CHECKUP_CrudePrev_MOE=CHECKUP_CrudePrev - LowCHECKUP_Crude95CI;
   CHOLSCREEN_CrudePrev_MOE=CHOLSCREEN_CrudePrev - LowCHOLSCREEN_Crude95CI;
   COLON_SCREEN_CrudePrev_MOE=COLON_SCREEN_CrudePrev - LowCOLON_SCREEN_Crude95CI;
   COPD_CrudePrev_MOE=COPD_CrudePrev - LowCOPD_Crude95CI;
   COREM_CrudePrev_MOE=COREM_CrudePrev - LowCOREM_Crude95CI;
   COREW_CrudePrev_MOE=COREW_CrudePrev - LowCOREW_Crude95CI;
   CSMOKING_CrudePrev_MOE=CSMOKING_CrudePrev - LowCSMOKING_Crude95CI;
   DENTAL_CrudePrev_MOE=DENTAL_CrudePrev - LowDENTAL_Crude95CI;
   DIABETES_CrudePrev_MOE=DIABETES_CrudePrev - LowDIABETES_Crude95CI;
   HIGHCHOL_CrudePrev_MOE=HIGHCHOL_CrudePrev - LowHIGHCHOL_Crude95CI;
   KIDNEY_CrudePrev_MOE=KIDNEY_CrudePrev - LowKIDNEY_Crude95CI;
   LPA_CrudePrev_MOE=LPA_CrudePrev - LowLPA_Crude95CI;
   MAMMOUSE_CrudePrev_MOE=MAMMOUSE_CrudePrev - LowMAMMOUSE_Crude95CI;
   MHLTH_CrudePrev_MOE=MHLTH_CrudePrev - LowMHLTH_Crude95CI;
   OBESITY_CrudePrev_MOE=OBESITY_CrudePrev - LowOBESITY_Crude95CI;
   PAPTEST_CrudePrev_MOE=PAPTEST_CrudePrev - LowPAPTEST_Crude95CI;
   PHLTH_CrudePrev_MOE=PHLTH_CrudePrev - LowPHLTH_Crude95CI;
   SLEEP_CrudePrev_MOE=SLEEP_CrudePrev - LowSLEEP_Crude95CI;
   STROKE_CrudePrev_MOE=STROKE_CrudePrev - LowSTROKE_Crude95CI;
   TEETHLOST_CrudePrev_MOE=TEETHLOST_CrudePrev - LowTEETHLOST_Crude95CI;

   keep geo2010

		ACCESS2_CrudePrev ARTHRITIS_CrudePrev BINGE_CrudePrev BPHIGH_CrudePrev BPMED_CrudePrev CANCER_CrudePrev
   		CASTHMA_CrudePrev CHD_CrudePrev CHECKUP_CrudePrev CHOLSCREEN_CrudePrev COLON_SCREEN_CrudePrev COPD_CrudePrev
		COREM_CrudePrev COREW_CrudePrev CSMOKING_CrudePrev DENTAL_CrudePrev DIABETES_CrudePrev HIGHCHOL_CrudePrev
		KIDNEY_CrudePrev LPA_CrudePrev MAMMOUSE_CrudePrev MHLTH_CrudePrev OBESITY_CrudePrev PAPTEST_CrudePrev PHLTH_CrudePrev
		SLEEP_CrudePrev STROKE_CrudePrev TEETHLOST_CrudePrev

		ACCESS2_CrudePrev_MOE ARTHRITIS_CrudePrev_MOE BINGE_CrudePrev_MOE BPHIGH_CrudePrev_MOE BPMED_CrudePrev_MOE CANCER_CrudePrev_MOE
   		CASTHMA_CrudePrev_MOE CHD_CrudePrev_MOE CHECKUP_CrudePrev_MOE CHOLSCREEN_CrudePrev_MOE COLON_SCREEN_CrudePrev_MOE COPD_CrudePrev_MOE
		COREM_CrudePrev_MOE COREW_CrudePrev_MOE CSMOKING_CrudePrev_MOE DENTAL_CrudePrev_MOE DIABETES_CrudePrev_MOE HIGHCHOL_CrudePrev_MOE
		KIDNEY_CrudePrev_MOE LPA_CrudePrev_MOE MAMMOUSE_CrudePrev_MOE MHLTH_CrudePrev_MOE OBESITY_CrudePrev_MOE PAPTEST_CrudePrev_MOE PHLTH_CrudePrev_MOE
		SLEEP_CrudePrev_MOE STROKE_CrudePrev_MOE TEETHLOST_CrudePrev_MOE

;

  label
    ACCESS2_CrudePrev = "Model-based estimate for crude prevalence of current lack of health insurance among adults aged 18-64 years"
    ARTHRITIS_CrudePrev = "Model-based estimate for crude prevalence of arthritis among adults aged >=18 years"
    BINGE_CrudePrev= "Model-based estimate for crude prevalence of binge drinking among adults aged >=18 years"
    BPHIGH_CrudePrev= "Model-based estimate for crude prevalence of high blood pressure among adults aged >=18 years" 
    BPMED_CrudePrev= "Model-based estimate for crude prevalence of taking medicine for high blood pressure control among adults aged >=18 years with high blood pressure" 
    CANCER_CrudePrev= "Model-based estimate for crude prevalence of cancer (excluding skin cancer) among adults aged >=18 years"
    CASTHMA_CrudePrev= "Model-based estimate for crude prevalence of current asthma among adults aged >=18 years" 
    CHD_CrudePrev= "Model-based estimate for crude prevalence of coronary heart disease among adults aged >=18 years" 
    CHECKUP_CrudePrev= "Model-based estimate for crude prevalence of visits to doctor for routine checkup within the past year among adults aged >=18 years" 
    CHOLSCREEN_CrudePrev= "Model-based estimate for crude prevalence of cholesterol screening among adults aged >=18 years" 
    COLON_SCREEN_CrudePrev= "Model-based estimate for crude prevalence of fecal occult blood test, sigmoidoscopy, or colonoscopy among adults aged 50–75 years" 
    COPD_CrudePrev= "Model-based estimate for crude prevalence of chronic obstructive pulmonary disease among adults aged >=18 years"
	COREM_CrudePrev= "Model-based estimate for crude prevalence of older adult men aged >=65 years who are up to date on a core set of clinical preventive services: Flu shot past year, PPV shot ever, Colorectal cancer screening" 
    COREW_CrudePrev= "Model-based estimate for crude prevalence of older adult women aged >=65 years who are up to date on a core set of clinical preventive services: Flu shot past year, PPV shot ever, Colorectal cancer screening, and Mammogram past 2 years" 
    CSMOKING_CrudePrev= "Model-based estimate for crude prevalence of current smoking among adults aged >=18 years" 
    DENTAL_CrudePrev= "Model-based estimate for crude prevalence of visits to dentist or dental clinic among adults aged >=18 years" 
    DIABETES_CrudePrev= "Model-based estimate for crude prevalence of diagnosed diabetes among adults aged >=18 years" 
    HIGHCHOL_CrudePrev= "Model-based estimate for crude prevalence of high cholesterol among adults aged >=18 years who have been screened in the past 5 years"
	KIDNEY_CrudePrev= "Model-based estimate for crude prevalence of chronic kidney disease among adults aged >=18 years" 
    LPA_CrudePrev= "Model-based estimate for crude prevalence of no leisure-time physical activity among adults aged >=18 years" 
    MAMMOUSE_CrudePrev= "Model-based estimate for crude prevalence of mammography use among women aged 50–74 years" 
	MHLTH_CrudePrev= "Model-based estimate for crude prevalence of mental health not good for >=14 days among adults aged >=18 years" 
    OBESITY_CrudePrev= "Model-based estimate for crude prevalence of obesity among adults aged >=18 years" 
    PAPTEST_CrudePrev= "Model-based estimate for crude prevalence of papanicolaou smear use among adult women aged 21–65 years" 
    PHLTH_CrudePrev= "Model-based estimate for crude prevalence of physical health not good for >=14 days among adults aged >=18 years"
	SLEEP_CrudePrev= "Model-based estimate for crude prevalence of sleeping less than 7 hours among adults aged >=18 years" 
    STROKE_CrudePrev= "Model-based estimate for crude prevalence of stroke among adults aged >=18 years" 
    TEETHLOST_CrudePrev= "Model-based estimate for crude prevalence of all teeth lost among adults aged >=65 years"
    

    ACCESS2_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of current lack of health insurance among adults aged 18 - 64 years"
    ARTHRITIS_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of arthritis among adults aged >=18 years"
    BINGE_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of binge drinking among adults aged >=18 years"
    BPHIGH_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of high blood pressure among adults aged >=18 years" 
    BPMED_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of taking medicine for high blood pressure control among adults aged >=18 years with high blood pressure" 
    CANCER_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of cancer (excluding skin cancer) among adults aged >=18 years"
    CASTHMA_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of current asthma among adults aged >=18 years" 
    CHD_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of coronary heart disease among adults aged >=18 years" 
    CHECKUP_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of visits to doctor for routine checkup within the past year among adults aged >=18 years" 
    CHOLSCREEN_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of cholesterol screening among adults aged >=18 years" 
    COLON_SCREEN_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of fecal occult blood test, sigmoidoscopy, or colonoscopy among adults aged 50–75 years" 
    COPD_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of chronic obstructive pulmonary disease among adults aged >=18 years"
	COREM_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of older adult men aged >=65 years who are up to date on a core set of clinical preventive services: Flu shot past year, PPV shot ever, Colorectal cancer screening" 
    COREW_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of older adult women aged >=65 years who are up to date on a core set of clinical preventive services: Flu shot past year, PPV shot ever, Colorectal cancer screening, and Mammogram past 2 years" 
    CSMOKING_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of current smoking among adults aged >=18 years" 
    DENTAL_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of visits to dentist or dental clinic among adults aged >=18 years" 
    DIABETES_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of diagnosed diabetes among adults aged >=18 years" 
    HIGHCHOL_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of high cholesterol among adults aged >=18 years who have been screened in the past 5 years"
	KIDNEY_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of chronic kidney disease among adults aged >=18 years" 
    LPA_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of no leisure-time physical activity among adults aged >=18 years" 
    MAMMOUSE_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of mammography use among women aged 50–74 years" 
	MHLTH_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of mental health not good for >=14 days among adults aged >=18 years" 
    OBESITY_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of obesity among adults aged >=18 years" 
    PAPTEST_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of papanicolaou smear use among adult women aged 21–65 years" 
    PHLTH_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of physical health not good for >=14 days among adults aged >=18 years"
	SLEEP_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of sleeping less than 7 hours among adults aged >=18 years" 
    STROKE_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of stroke among adults aged >=18 years" 
    TEETHLOST_CrudePrev_MOE = "Estimated confidence interval for crude prevalence of all teeth lost among adults aged >=65 years"
		;

run;


** Save final dataset to SAS1 **;

%Finalize_data_set( 
  data=CDC500_2017,
  out=CDC500_2017_sum_tr10,
  outlib=CDC500,
  label="Centers for Disease Control and Prevention 500 cities project census tract-level data 2017 release",
  sortby=geo2010,
  restrictions=None,
  revisions=New File.
  );

  /* End of program */
