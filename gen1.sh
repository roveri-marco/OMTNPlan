#!/bin/sh

# DIRS=`ls pddl_examples/nl | grep -v clearance`
DIRS="hvac/"


OMTP="/home/roveri/work/Planning/OMTNPlan/omtplan.py"

cd pddl_examples/nl/sec_clearance_sdac
PBS=`ls | grep domain | cut -d_ -f5-6`
for i in ${PBS}; do
  echo $i
  ${OMTP} -dump -domain domain_sec_clear_nl_$i -linear -omt -b 100 prob_sec_clear_nl_$i
done
