#!/bin/bash
#
#PBS -l nodes=3:ppn=20
#PBS -q qdasi200p48h
#PBS -l walltime=48:00:00
#PBS -N spark-test
#PBS -e /work/ayush/sparktest/errorlog.txt
#PBS -o /work/ayush/sparktest/oplog.txt
