############################################################################
##    This file is part of OMTPlan.
##
##    OMTPlan is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    OMTPlan is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with OMTPlan.  If not, see <https://www.gnu.org/licenses/>.
############################################################################

from z3 import *
from planner import plan
from planner import encoder
import utils
import numpy as np

rewrite_objective = True

class Search():
    """
    Base class defining search schemes.
    """

    def __init__(self, encoder, ub, prefix="dump_"):
        self.encoder = encoder
        self.found = False
        self.solution = None
        self.solver = None
        self.ub = ub
        self.prefix = prefix

    def set_prefix(self, name):
        self.prefix = name
        pass

class SearchSMT(Search):
    """
    Search class for SMT-based encodings.
    """

    def do_linear_search(self, dump=False):
        """
        Linear search scheme for SMT encodings with unit action costs.

        Optimal plan is obtained by simple ramp-up strategy
        """

        # Defines initial horizon for ramp-up SMT search

        self.horizon = 1

        print('Start linear search SMT')

        # Build formula until a plan is found or upper bound is reached

        while not self.found and self.horizon < self.ub:
            res = unknown

            # Create SMT solver instance
            self.solver = Solver()

            # Build planning subformulas
            formula =  self.encoder.encode(self.horizon)

            # Assert subformulas in solver
            for k,v in formula.items():
                self.solver.add(v)

            if dump == True:
                filename = self.prefix + "_" + str(self.horizon) + ".smt2"
                print('Dumping SMT file {}'.format(filename))
                with open(filename, mode='w') as f:
                    f.write(self.solver.to_smt2())
                    f.write("(exit)")
            else:
                # Check for satisfiability
                res = self.solver.check()

            if res == sat:
                self.found = True
            else:
                # Increment horizon until we find a solution
                self.horizon = self.horizon + 1

        if self.found:
            # Extract plan from model
            model = self.solver.model()
            self.solution = plan.Plan(model, self.encoder)

        return self.solution


class SearchOMT(Search):
    """
    Search class for OMT-based encodings.
    """

    def computeHorizonSchedule(self):
        """
        Computes horizon schedule given upper bound for search.
        Here percentages are fixed.
        """

        schedule = []
        percentages = [10,15,20,25,35,50,75,100]

        def percentage(percent, whole):
            return (percent * whole) / 100

        for p in percentages:
            schedule.append(percentage(p,self.ub))

        return schedule


    def do_search(self, dump=False):
        """
        Search scheme for OMT encodings with unit, constant or state-dependent action costs.
        """

        print('Start search OMT')

        # Try different horizons

        horizon_schedule = self.computeHorizonSchedule()

        # Start building formulae

        for horizon in horizon_schedule:
            res = unknown
            print('Try horizon {}'.format(horizon))

            # Create OMT solver instance
            self.solver = Optimize()

            # Build planning subformulas
            formula = self.encoder.encode(horizon)

            # Assert subformulas in solver
            for label, sub_formula in formula.items():

                if label == 'objective':
                    # objective function requires different handling
                    # as per Z3 API
                    if rewrite_objective:
                        fvcost = Real('__rev_fv_cost_{}'.format(horizon))
                        self.solver.add(fvcost == sub_formula)
                        self.solver.minimize(fvcost)
                    else:
                        objective = self.solver.minimize(sub_formula)
                elif label ==  'real_goal':
                    # we don't want to assert goal formula at horizon
                    # see construction described in related paper
                    pass
                else:
                    self.solver.add(sub_formula)

            if dump == True:
                filename = self.prefix + "_" + str(horizon)  + ".smt2"
                print('Dumping OMT file {}'.format(filename))
                with open(filename, mode='w') as f:
                    f.write("; benchmark generated from Z3 python API\n")
                    f.write("(set-info :status unknown)\n")
                    sexpr = self.solver.sexpr()
                    f.write(sexpr)
                    f.write("(exit)")

            else:
                print('Checking formula')

                res = self.solver.check()

                # If formula is unsat, the problem does not admit solution
                # see Theorem 1 in related paper

                if res == unsat:
                    print('Problem not solvable')

                else:
                    # Check if model satisfied concrete goal
                    model = self.solver.model()
                    opt = model.eval(formula['real_goal'])

                    # if formula is sat and G_n is satisfied, solution is optimal
                    # see Theorem 2 in related paper

                    if opt:
                        self.solution =  plan.Plan(model, self.encoder, objective)
                        break

        return self.solution
