/we store 
//the smallest three primes of ordinary reduction such that p is not 3 [ordinary_pr]
//the sets of known points on all curves [pts]
//Mumford representations for generators of the free part of Jacobian [gens]
//Mumford representation for the torsion part of the Jacobian [tor_bas]
//orders of generators for the torsion part [tor_ord]
_<x> := PolynomialRing(Rationals());

ordinary_pr := [
    [ 7, 13, 17 ],
    [ 7, 13, 17 ],
    [ 7, 13, 17 ]
];

pts :=  [
    [ (-1 , -1 , 1), (-1 , 1 , 1), (1 , -1 , 1), (1 , 1 , 1) ],
    [ (-1 , -2 , 1), (-1 , 2 , 1), (1 , -2 , 1), (1 , 2 , 1) ],
    [ (-1 , -3 , 1), (-1 , 3 , 1), (1 , -3 , 1), (1 , 3 , 1) ]
];

gens := [
    [
        [
            x^2 - 1,
            -1
        ],
        [
            x^2 - 1,
            -x
        ]
    ],
    [
        [
            x^2 - x - 5,
            -2
        ],
        [
            x^2 + x - 5,
            -2
        ]
    ],
    [
        [
            x^2 - 1,
            -3*x
        ],
        [
            x^2 - 1,
            3
        ]
    ]
];

tor_ord := [[2],[2],[2]];
