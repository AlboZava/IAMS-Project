function plotTransferOrbit(a1, a2, e1, e2, i1, i2, OM1, OM2, om1, om2, mu, type)

rp1 = a1 * (1 - e1);
rp2 = a2 * (1 - e2);
ra1 = a1 * (1 + e1);
ra2 = a2 * (1 + e2);

switch type
    case 'pa'
        rp_t = rp1;
        ra_t = ra2;
        a_t = (rp_t + ra_t) / 2;
        e_t = (ra_t - rp_t) / (ra_t + rp_t);
        
        [~, omf, theta] = changeOrbitalPlane(a1, e1, i1, OM1, om1, i2, OM2, mu);
        [~, thi, thf] = changePericenterArg(a_t, e_t, om1, omf, mu);

        plotOrbit(a_t, e_t, i1, OM1, om1, 0, pi, 0.01, mu);

    case 'ap'
        rp_t = rp2;
        ra_t = ra1;
        a_t = (rp_t + ra_t) / 2;
        e_t = (ra_t - rp_t) / (ra_t + rp_t);

        plotOrbit(a_t, e_t, i1, OM1, om1, 180, 360, 1, mu);

    case 'pp'
        rp_t = rp1;
        ra_t = rp2;
        a_t = (rp_t + ra_t) / 2;
        e_t = (ra_t - rp_t) / (ra_t + rp_t);

        plotOrbit(a_t, e_t, i1, OM1, om1, 0, 180, 1, mu);
        
    case 'aa'
        rp_t = ra1;
        ra_t = ra2;
        a_t = (rp_t + ra_t) / 2;
        e_t = (ra_t - rp_t) / (ra_t + rp_t);

        plotOrbit(a_t, e_t, i1, OM1, om1, 180, 360, 1, mu);

    case 'be'
        rp_t1 = rp1;
        rp_t2 = rp2;
        ra_t = 20000;

        a_t1 = (rp_t1 + ra_t) / 2;
        a_t2 = (rp_t2 + ra_t) / 2;

        e_t1 = (ra_t - rp_t1) / (ra_t + rp_t1);
        e_t2 = (ra_t - rp_t2) / (ra_t + rp_t2);

        
        plotOrbit(a_t1, e_t1, i1, OM1, om1, 0, 360, 1, mu);
        plotOrbit(a_t2, e_t2, i2, OM2, om2, 0, 360, 1, mu);

end

