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

proc import datafile="L:\Libraries\CDC500\Raw\500cities_raw.csv"
   out=CDC500_2017
   dbms=csv
   replace;
   getnames=yes;
run;


data CDC500_2017;
   set CDC500_2017;
  * input ACCESS2_Crude95CI $60.;
   LowACCESS2_Crude95CI= scan(ACCESS2_Crude95CI, 1, '(,');
   LowARTHRITIS_Crude95CI= scan(ARTHRITIS_Crude95CI, 1,'(,');
   LowBINGE_Crude95CI = scan(BINGE_Crude95CI, 1,'(,');
   LowBPHIGH_Crude95CI= scan(BPHIGH_Crude95CI , 1,'(,');
   LowBPMED_Crude95CI= scan(BPMED_Crude95CI , 1,'(,');
   LowCANCER_Crude95CI= scan(CANCER_Crude95CI , 1,'(,');
   LowCASTHMA_Crude95CI= scan(CASTHMA_Crude95CI , 1,'(,');
   LowCHD_Crude95CI= scan(CHD_Crude95CI , 1,'(,');
   LowCHECKUP_Crude95CI= scan(CHECKUP_Crude95CI , 1,'(,');
   LowCHOLSCREEN_Crude95CI= scan(CHOLSCREEN_Crude95CI , 1,'(,');
   LowCOLON_SCREEN_Crude95CI= scan(COLON_SCREEN_Crude95CI , 1,'(,');
   LowCOPD_Crude95CI= scan(COPD_Crude95CI , 1,'(,');
   LowCOREM_Crude95CI= scan(COREM_Crude95CI , 1,'(,');
   LowCOREW_Crude95CI= scan(COREW_Crude95CI , 1,'(,');
   LowCSMOKING_Crude95CI= scan(CSMOKING_Crude95CI , 1,'(,');
   LowDENTAL_Crude95CI= scan(DENTAL_Crude95CI , 1,'(,');
   LowDIABETES_Crude95CI= scan(DIABETES_Crude95CI , 1,'(,');
   LowHIGHCHOL_Crude95CI= scan(HIGHCHOL_Crude95CI , 1,'(,');
   LowKIDNEY_Crude95CI= scan(KIDNEY_Crude95CI , 1,'(,');
   LowLPA_Crude95CI= scan(LPA_Crude95CI , 1,'(,');
   LowMAMMOUSE_Crude95CI= scan(MAMMOUSE_Crude95CI , 1,'(,');
   LowMHLTH_Crude95CI= scan(MHLTH_Crude95CI , 1,'(,');
   LowOBESITY_Crude95CI= scan(OBESITY_Crude95CI , 1,'(,');
   LowPAPTEST_Crude95CI= scan(PAPTEST_Crude95CI , 1,'(,');
   LowPHLTH_Crude95CI= scan(PHLTH_Crude95CI , 1,'(,');
   LowSLEEP_Crude95CI= scan(SLEEP_Crude95CI , 1,'(,');
   LowSTROKE_Crude95CI= scan(STROKE_Crude95CI , 1,'(,');
   LowTEETHLOST_Crude95CI= scan(TEETHLOST_Crude95CI , 1,'(,');
run;

data CDC500_2017;
   set CDC500_2017;
   SEACCESS2_CrudePrev=ACCESS2_CrudePrev-LowACCESS2_Crude95CI;
   SEARTHRITIS_CrudePrev= ARTHRITIS_CrudePrev-LowARTHRITIS_Crude95CI;
   SEBINGE_CrudePrev=BINGE_CrudePrev - LowARTHRITIS_Crude_95CI;
   SEBPHIGH_CrudePrev=BPHIGH_CrudePrev - LowBINGE_Crude_95CI;
   SEBPMED_CrudePrev=BPMED_CrudePrev - LowBPHIGH_Crude_95CI;
   SECANCER_CrudePrev=CANCER_CrudePrev - LowBPMED_Crude_95CI;
   SECASTHMA_CrudePrev=CASTHMA_CrudePrev - LowCANCER_Crude_95CI;
   SECHD_CrudePrev=CHD_CrudePrev - LowCASTHMA_Crude_95CI;
   SECHECKUP_CrudePrev=CHECKUP_CrudePrev - LowCHD_Crude_95CI;
   SECHOLSCREEN_CrudePrev=CHOLSCREEN_CrudePrev - LowCHECKUP_Crude_95CI;
   SECOLON_SCREEN_CrudePrev=COLON_SCREEN_CrudePrev - LowCHOLSCREEN_Crude_95CI;
   SECOPD_CrudePrev=COPD_CrudePrev - LowCOLON_SCREEN_Crude_95CI;
   SECOREM_CrudePrev=COREM_CrudePrev - LowCOPD_Crude_95CI;
   SECOREW_CrudePrev=COREW_CrudePrev - LowCOREM_Crude_95CI;
   SECSMOKING_CrudePrev=CSMOKING_CrudePrev - LowCOREW_Crude_95CI;
   SEDENTAL_CrudePrev=DENTAL_CrudePrev - LowCSMOKING_Crude_95CI;
   SEDIABETES_CrudePrev=DIABETES_CrudePrev - LowDENTAL_Crude_95CI;
   SEHIGHCHOL_CrudePrev=HIGHCHOL_CrudePrev - LowDIABETES_Crude_95CI;
   SEKIDNEY_CrudePrev=KIDNEY_CrudePrev - LowHIGHCHOL_Crude_95CI;
   SELPA_CrudePrev=LPA_CrudePrev - LowKIDNEY_Crude_95CI;
   SEMAMMOUSE_CrudePrev=MAMMOUSE_CrudePrev - LowLPA_Crude_95CI;
   SEMHLTH_CrudePrev=MHLTH_CrudePrev - LowMAMMOUSE_Crude_95CI;
   SEOBESITY_CrudePrev=OBESITY_CrudePrev - LowMHLTH_Crude_95CI;
   SEPAPTEST_CrudePrev=PAPTEST_CrudePrev - LowOBESITY_Crude_95CI;
   SEPHLTH_CrudePrev=PHLTH_CrudePrev - LowPAPTEST_Crude_95CI;
   SESLEEP_CrudePrev=SLEEP_CrudePrev - LowPHLTH_Crude_95CI;
   SESTROKE_CrudePrev=STROKE_CrudePrev - LowSLEEP_Crude_95CI;
   SETEETHLOST_CrudePrev=TEETHLOST_CrudePrev - LowSTROKE_Crude_95CI;

run;


proc sort data=CDC500_2017 out=CDC500.CDC500_2017 (label="CDC 500 Cities 2017 data");
  by TractFIPS;

proc contents data=CDC500_2017;
run;
