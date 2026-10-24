# Physical Design Artifacts

This folder contains the saved OpenLane run outputs for pill_reminder.

- logs/cmds.log records the run commands.
- logs/openlane.log and logs/flow.log record the flow execution and completion.
- reports contains stage, timing, manufacturability, DRC, and LVS reports.
- results contains stage outputs and final views, including the GDSII at results/final/gds/pill_reminder.gds.
- PDK_SOURCES records the open_pdks revision used by the run.

The saved flow log reports completion, no setup or hold violations at the Typical corner, and no Magic DRC violations after routing or GDS streaming. The manufacturability report records zero LVS errors and zero antenna pin or net violations.

The log also records a scaled power grid because the core is small for the selected settings. VSRC_LOC_FILES was not set, which may affect IR-drop analysis accuracy. The transient OpenLane tmp directory is omitted; reports and results are retained.
