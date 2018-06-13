/**************************************************************************
 Program:  CDC500_sum_all.sas
 Library:  CDC 500
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  06/13/2018
 Version:  SAS 9.4
 Environment:  Windows with SAS/Connect
 
 Description:  Create all summary files from CDC 500 tract summary file.

 Modifications:

**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( CDC500 )

%let pct_vars = ACCESS2_CrudePrev ARTHRITIS_CrudePrev BINGE_CrudePrev BPHIGH_CrudePrev BPMED_CrudePrev CANCER_CrudePrev
   		CASTHMA_CrudePrev CHD_CrudePrev CHECKUP_CrudePrev CHOLSCREEN_CrudePrev COLON_SCREEN_CrudePrev COPD_CrudePrev
		COREM_CrudePrev COREW_CrudePrev CSMOKING_CrudePrev DENTAL_CrudePrev DIABETES_CrudePrev HIGHCHOL_CrudePrev
		KIDNEY_CrudePrev LPA_CrudePrev MAMMOUSE_CrudePrev MHLTH_CrudePrev OBESITY_CrudePrev PAPTEST_CrudePrev PHLTH_CrudePrev
		SLEEP_CrudePrev STROKE_CrudePrev TEETHLOST_CrudePrev ;

%Create_all_summary_from_tracts( 

  /** Change to N for testing, Y for final batch mode run **/
  register=Y,
  
  /** Update with information on latest file revision **/
  revisions=%str(New File),

  lib=CDC500,
  data_pre=Cdc500_2017, 
  data_label=%str(CDC500 summary, DC),
  count_vars=, 
  prop_vars=&pct_vars., 
  calc_vars=, 
  calc_vars_labels=,
  creator_process=CDC500_sum_all.sas,
  tract_yr=2010,
  restrictions=None
)

run;
