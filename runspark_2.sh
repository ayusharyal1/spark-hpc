echo '>> Start of Script'
nodes=($( cat $PBS_NODEFILE | sort | uniq ))
nnodes=${#nodes[@]}
last=$(( $nnodes - 1 ))

export SPARK_HOME=/work/spark/
ssh ${nodes[0]} "cd ${SPARK_HOME}; ./sbin/start-master.sh"
sparkmaster="spark://${nodes[0]}:7077"
echo 'master created'

rm -rf wordcounts
echo 'Output folder cleaned'

for i in $( seq 0 $last )
do
    ssh ${nodes[$i]} "cd ${SPARK_HOME}; nohup ./sbin/start-slave ${sparkmaster} &> /work/spark-hpc/nohup-${nodes[$i]}.out" &
done
echo 'Worker Started'

${SPARK_HOME}/bin/spark-submit /work/spark-hpc/sparkscript.py
echo 'Application Submitted'

ssh ${nodes[0]} " cd ${SPARK_HOME}; ./sbin/stop-all.sh"
echo 'Master and slaves closed'
echo '<< End of Script'
