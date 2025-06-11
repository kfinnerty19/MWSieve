load("auxdata.sage") 

OmegaSizes=[]

R = [0..len(equations)] #to consider for i in R indices in equations
n = 25 #precision
N = 4 #precision for sieve

def make_affine(P,X):
    x,y,z = P
    if z == 0:
        if x*y > 0:
            return "inf+"
        else:
            return "inf-"
    else:
        return X(x/z, y/z^3,1)

coeffs_fake_lists = []

for i in R:
    print(50 * "*")
    print("Curve # %s" % (i + 1))
    
    f = equations[i]
    X = HyperellipticCurve(f)
    
    print("testing for y^2 = %s" % f)
    sys.stdout.flush()
    
    primes = ordinary_pr[i]
    allpoints = [make_affine(P, X) for P in pts[i]]
    
    if len(allpoints) == 0:  # no known rational points
        coeffs_fake_lists.append([[[], [], []]])
        continue
    
    im_div = projE1E2[i]
    base_pt = allpoints[0]
    rat_pts_lists = []
    coeffs_fake_lists_c = [[] for k in range(len(primes))]
    
    for p in primes:
        if primes.index(p) == 0:
            b = True
        else:
            b = False
        
        try:
            rat_points, other_points, omega = quadratic_chabauty_bielliptic_exceptional(f, p, n, omega_info=True, up_to_auto=b)
        except:
            print("error", p)
        
        if b:
            for l in range(len(rat_points)):
                rat_points_new_complete = []
                for P in rat_points[l]:
                    rat_points_new_complete.extend([P, X(P[0], -P[1], P[2]), X(-P[0], P[1], P[2]), X(-P[0], -P[1], P[2])])
                rat_points[l] = list(Set(rat_points_new_complete))
                rat_points[l].sort()
            OmegaSizes.append(omega)
        
        rat_pts_lists.append(rat_points)
        
        print("Other points =", len(list(set().union(*other_points))))
        sys.stdout.flush()
    
        rat_points_new = list(set().union(*rat_points))
        rat_points_new_new = rat_points_new[:]
        
        if X(0, 1, 0) in rat_points_new_new:
            rat_points_new.remove(X(0, 1, 0))
            rat_points_new.extend(['inf+', 'inf-'])
        
        if Set(rat_points_new) == Set(allpoints):
            pass
        else:
            print("Not all rational points detected (or, more likely, point at infinity detected)")
            print("see below")
            print(rat_points_new)
        try:
            coeffs_rat = coefficients_mod_pN_v2(f, allpoints, im_div, base_pt, p, N, k=5)
            coeffs_rat_int = [[ZZ(c[0]), ZZ(c[1])] for c in coeffs_rat]  # sanity check that MW coeffs of rat points are p-adically integral
            for r in range(len(other_points)):
                if other_points[r] == []:
                    coeffs_fake_lists_c[primes.index(p)].append([])
                else:
                    try:
                        coeffs_fake = coefficients_mod_pN_v2(f, other_points[r], im_div, base_pt, p, N, k=5)
                    except:
                        coeffs_fake = coefficients_mod_pN_v2(f,other_points[r][:len(other_points[r])-1],im_div,base_pt,p,N,k=5)
                    if min([min([coeffs_fake[i][0].precision_absolute(), coeffs_fake[i][1].precision_absolute()]) for i in range(len(coeffs_fake))]) < N:
                        coeffs_fake = coefficients_mod_pN_v2(f, other_points[r], im_div, base_pt, p, N, k=10)
                    
                    assert min([min([coeffs_fake[i][0].precision_absolute(), coeffs_fake[i][1].precision_absolute()]) for i in range(len(coeffs_fake))]) >= N, "Problem with precision of coefficients."
                    
                    coeffs_fake_int = [[ZZ(c[0]), ZZ(c[1])] for c in coeffs_fake if c[0].valuation(p) >= 0 and c[1].valuation(p) >= 0]
                    coeffs_fake_lists_c[primes.index(p)].append(coeffs_fake_int)
        except: 
            print("problem",p)
    coeffs_fake_lists.append(coeffs_fake_lists_c)
    print("........")
    sys.stdout.flush()
    print((rat_pts_lists[0] == rat_pts_lists[1]) and (rat_pts_lists[1] == rat_pts_lists[2]))
    i = i+1
    
print(coeffs_fake_lists)
