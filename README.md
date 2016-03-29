# spark-hpc

A sample pbs script to run a wordcount example in hpc cluster.

-- runspark_1.sh

      instantiates a cluster on hpc environment (run qsub -I runspark_1.sh) 
-- runspark_2.sh 

       creates master, slave, submits the application and closes master&slaves after completion
-- sparkscript.py

      -- a word count example for spark.
