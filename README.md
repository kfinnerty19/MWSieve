# MWSieve

Generalizing and using code from [A2023] https://github.com/oana-adascalitei/MWSieveForDatabase 

Description of files:

- allcurves: equations for the curves of the example in Example.txt

- allcurvesComputation: compute set of known points (pts), information from generators(J), projE1E2, and three smallest primes of good ordinary reduction [A2023]

- allcurvesOutput: for the curves of the example in Example.txt, stores the smallest three primes of ordinary reduction such that p is not 3, the sets of known points on all curves, and orders of generators for the torsion part

- auxdata: for the curves of the example in Example.txt, stores the smallest three primes of ordinary reduction such that p is not 3, the sets of known points on all curves, and the projection of generators of the Jacobian to the corresponding two elliptic curves. 

- Example: for three curves, shows the step-by-step of the process to eliminate all points via the sieve.

- fake_allcurves: for the curves of the example in Example.txt, the torsion information, the sizes of the Omega sets, and extra points from the QC computations that we are trying to eliminate

- MainCode: we run the Mordell-Weil sieve (MWSieve) inputing the pre-computed information on all curves from allcurves.m, which is successful in eliminating all the extra points resulted from the QC computations stored in fake_allcurves.m [A2023]

- MWSPrimes: for the curves of the example in Example.txt, we store the pre-computed mws_primes with respect to aux_int = 1 (MWSPrimes), aux_int = 2 (MWSPrimes2), aux_int = 4 (MWSPrimes4)

- MWSPrimesComputation: We compute the sieving primes for different values of aux_int [A2023]

- MWSieveCode: code taken from https://github.com/steffenmueller/QCMod

- NewFunctions: "ellproj" projects points from J(Q) to E1(Q),E2(Q), "BiellipticModel" takes as input a genus 2 bielliptic curve and outputs a bielliptic model y^2 = f(x^2) [A2023]

- qc_running_file: adapted from https://github.com/bianchifrancesca/QC_bielliptic

- sieve_with_no_known_points: Let X be a genus 2 bielliptic curve over Q, with no known point in X(Q). This is a simple sieve to show that X(Q) = empty set, so QC is not necessary for this case. [A2023]

- TorsionStatistics: We count the number of curves whose Jacobians have torsion subgroups of order 1,2,3,4,5,6,respectively [A2023]
