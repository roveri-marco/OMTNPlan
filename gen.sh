#!/bin/sh

# DIRS=`ls pddl_examples/nl | grep -v clearance`
DIRS="nl_counters_simple/ nl_counters/  hvac/  car_nl/ convoys_nl/"


OMTP="/home/roveri/work/Planning/OMTNPlan/omtplan.py"
for i in ${DIRS}; do
  echo pddl_examples/nl/$i
  cd pddl_examples/nl/$i
  for j in `ls *inst*.pddl`; do
    echo $j
    ${OMTP} -dump -domain domain.pddl -linear -omt -b 100 $j
  done
  cd -
done

cd pddl_examples/nl/sec_clearance_sdac
PBS=`ls | grep domain | cut -d_ -f5-6`
for i in ${PBS}; do
  echo $i
  ${OMTP} -dump -domain domain_sec_clear_nl_$i -linear -omt -b 100 prob_sec_clear_nl_$i
done
