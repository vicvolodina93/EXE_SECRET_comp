# EXE_SECRET_comp

A repository to perform emulation and inverse problem (history-matching or 
Bayesian calibration) for **Systemic Circulation Model**. 

### data_prelim folder

The **data_prelim folder** contains cvs files to perform preliminary data
analysis only considering 40 model runs:

**Design**:
 
 * `design_em.csv` contain a Maximin Latin Hypercube design of size 40 with variable 
 being in the range [-1, 1]. Note that the column names V1, V2, V3, V4 and V5 
 correspond to $f_2$, $f_3$, $f_{s_2}$, $f_{s_3}$ and $\alpha$ respectively.
 * `design_sim.csv` design with inputs scaled to original scale.

**Outputs**: 
 
 * `maxmin.csv` contains the maximum and minimum pressure for 40 runs.
 * `flow1.csv` contains time-series flow values from vessel 1, a data frame 512 by 40, where
 each column corresponds to a simulation run.
 
 You can start looking at this data while we are running a larger design on a server.

### data_comp folder

The **data_comp** folder contains
 
 * `design_em.csv` contain a Maximin Latin Hypercube design of size 1250 with variable 
 being in the range [-1, 1].
 * `design_sim.csv` design with inputs scaled to original scale.
 * `flow1_all.rds`, ..., `flow7_all.rds` are 512x1250 data frames containing the 7 flow outputs, where the 1250 columns correspond to the 1250 design points.
 * `maxmin_all.rds` is a 1250x3 data frame containing the max and min pressure outputs across the 1250 design points.
 
 

 

