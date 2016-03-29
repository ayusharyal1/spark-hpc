# spark-hpc

A sample pbs script to run a wordcount example in hpc cluster.

-- runspark_1.sh \n
      instantiates a cluster on hpc environment (run qsub -I runspark_1.sh) \n
-- runspark_2.sh \n
       creates master, slave, submits the application and closes master&slaves after completion\n
-- sparkscript.py\n
      -- a word count example for spark.\n
