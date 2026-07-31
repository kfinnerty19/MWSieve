# MWSieve

This repository describes how to apply code primarily from Oana Padurariu's repository [MWSieveForDatabse](https://github.com/oana-adascalitei/MWSieveForDatabase) to specific examples in the paper "The possible adelic indices for elliptic curves admitting a rational cyclic isogeny" by [Kate Finnerty](katefinnertymath.com), [Jacob Mayle](https://www.jacobmayle.com/), [Rakvi](https://raakvi.wixsite.com/rakvi), and [Tyler Genao](https://tylergenao.com/).

The file Example.txt shows how to use the code for the three specific examples that appear in the paper. In particular, it describes which steps must be done in Magma versus in Sage.

This code was last updated in June 2025. If you have questions or suggestions, please contact Kate Finnerty at finnerty(at)math(dot)harvard(dot)edu.

# Installation Instructions 

1. If necessary, ensure you have up-to-date versions of [Magma](https://magma.maths.usyd.edu.au/magma/) and [Sage](https://sagemath.org).
2. Download the repositories [MWSieveForDatabase](https://github.com/oana-adascalitei/MWSieveForDatabase) of Oana Padurariu and [QCBielliptic](https://github.com/kfinnerty19/QC_bielliptic) of Kate Finnerty.
3. From MWSieveForDatabase, move the files MWSieveCode.m, NewFunctions.m, allcurvesComputation.m, MainCode.m, and TorsionStatistics.m to Magma's directory folder (use the GetCurrentDirectory() command in Magma to see the current directory).
4. From QCBielliptic, move the file qc_g2_bielliptic.sage to Sage's directory folder (to see the current directory in Sage, run import os followed by os.getcwd()).

# Description of files:

- allcurves: equations for the curves of the example in Example.txt

- allcurvesOutput: for the curves of the example in Example.txt, stores the smallest three primes of ordinary reduction such that p is not 3, the sets of known points on all curves, and orders of generators for the torsion part

- auxdata: for the curves of the example in Example.txt, stores the smallest three primes of ordinary reduction such that p is not 3, the sets of known points on all curves, and the projection of generators of the Jacobian to the corresponding two elliptic curves. 

- Example: for three curves, shows the step-by-step of the process to eliminate all points via the sieve.

- fake_allcurves: for the curves of the example in Example.txt, the torsion information, the sizes of the Omega sets, and extra points from the QC computations that we are trying to eliminate

- MWSPrimes: for the curves of the example in Example.txt, we store the pre-computed mws_primes with respect to aux_int = 1 (MWSPrimes), aux_int = 2 (MWSPrimes2), aux_int = 4 (MWSPrimes4)

- MWSPrimesComputation: We compute the sieving primes for different values of aux_int. This is built off of the version in [A2023]

- qc_running_file: Creates the sets of rational points and other p-adic points. adapted from https://github.com/bianchifrancesca/QC_bielliptic