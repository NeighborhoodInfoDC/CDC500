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
   out=CDC500_2017raw
   dbms=csv
   replace;
   getnames=yes;
run;


data CDC500_2017_2;
   set CDC500_2017raw;
  * input ACCESS2_Crude95CI $60.;
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
run;

data CDC500_2017_final;
   set CDC500_2017_2;
   MOEACCESS2_CrudePrev=ACCESS2_CrudePrev-LowACCESS2_Crude95CI;
   MOEARTHRITIS_CrudePrev= ARTHRITIS_CrudePrev-LowARTHRITIS_Crude95CI; 
   MOEBINGE_CrudePrev=BINGE_CrudePrev - LowBINGE_Crude95CI;
   MOEBPHIGH_CrudePrev=BPHIGH_CrudePrev - LowBPHIGH_Crude95CI;
   MOEBPMED_CrudePrev=BPMED_CrudePrev - LowBPMED_Crude95CI;
   MOECANCER_CrudePrev=CANCER_CrudePrev - LowCANCER_Crude95CI;
   MOECASTHMA_CrudePrev=CASTHMA_CrudePrev - LowCASTHMA_Crude95CI;
   MOECHD_CrudePrev=CHD_CrudePrev - LowCHD_Crude95CI;
   MOECHECKUP_CrudePrev=CHECKUP_CrudePrev - LowCHECKUP_Crude95CI;
   MOECHOLSCREEN_CrudePrev=CHOLSCREEN_CrudePrev - LowCHOLSCREEN_Crude95CI;
   MOECOLON_SCREEN_CrudePrev=COLON_SCREEN_CrudePrev - LowCOLON_SCREEN_Crude95CI;
   MOECOPD_CrudePrev=COPD_CrudePrev - LowCOPD_Crude95CI;
   MOECOREM_CrudePrev=COREM_CrudePrev - LowCOREM_Crude95CI;
   MOECOREW_CrudePrev=COREW_CrudePrev - LowCOREW_Crude95CI;
   MOECSMOKING_CrudePrev=CSMOKING_CrudePrev - LowCSMOKING_Crude95CI;
   MOEDENTAL_CrudePrev=DENTAL_CrudePrev - LowDENTAL_Crude95CI;
   MOEDIABETES_CrudePrev=DIABETES_CrudePrev - LowDIABETES_Crude95CI;
   MOEHIGHCHOL_CrudePrev=HIGHCHOL_CrudePrev - LowHIGHCHOL_Crude95CI;
   MOEKIDNEY_CrudePrev=KIDNEY_CrudePrev - LowKIDNEY_Crude95CI;
   MOELPA_CrudePrev=LPA_CrudePrev - LowLPA_Crude95CI;
   MOEMAMMOUSE_CrudePrev=MAMMOUSE_CrudePrev - LowMAMMOUSE_Crude95CI;
   MOEMHLTH_CrudePrev=MHLTH_CrudePrev - LowMHLTH_Crude95CI;
   MOEOBESITY_CrudePrev=OBESITY_CrudePrev - LowOBESITY_Crude95CI;
   MOEPAPTEST_CrudePrev=PAPTEST_CrudePrev - LowPAPTEST_Crude95CI;
   MOEPHLTH_CrudePrev=PHLTH_CrudePrev - LowPHLTH_Crude95CI;
   MOESLEEP_CrudePrev=SLEEP_CrudePrev - LowSLEEP_Crude95CI;
   MOESTROKE_CrudePrev=STROKE_CrudePrev - LowSTROKE_Crude95CI;
   MOETEETHLOST_CrudePrev=TEETHLOST_CrudePrev - LowTEETHLOST_Crude95CI;

run;

/*
proc sort data=CDC500_2017 out=CDC500.CDC500_2017 (label="CDC 500 Cities 2017 data");
  by TractFIPS;

proc contents data=CDC500_2017;
run;
*/


** Save final dataset to SAS1 **;

%Finalize_data_set( 
  data=CDC500_2017_final,
  out=CDC500_2017,
  outlib=CDC500,
  label="Centers for Disease Control and Prevention 500 cities project census tract-level data 2017 release",
  sortby=TractFIPS,
  restrictions=None,
  revisions=New File.
  );
