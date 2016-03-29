from pyspark import SparkContext

path="/work/spark-hpc"
sc = SparkContext(appName="wordCount")  
file = sc.textFile(path+"/data/*.txt")  
counts = file.flatMap(lambda line: line.split(" ")).map(lambda word: (word, 1)).reduceByKey(lambda a, b: a+b)  
counts.saveAsTextFile(path+"/wordcounts")  
