% Change of plane maneuver
%
% [DeltaV, omf, theta] = changeOrbitalPlane(a, e, i_i, OMi, omi, i_f, OMf, mu)
%
% ----------------------------------------------------------------------
% Input arguments:
% a          [1x1]  semi-major axis                 [km]
% e          [1x1]  eccentricity                    [-]
% i_i        [1x1]  initial inclination             [rad]
% OMi        [1x1]  initial RAAN                    [rad]
% omi        [1x1]  initial pericenter anomaly      [rad]
% i_f        [1x1]  final inclination               [rad]
% OMf        [1x1]  final RAAN                      [rad]
% mu         [1x1]  gravitational parameter         [km^3/s^2]
%
% ----------------------------------------------------------------------
% Output arguments:
% DeltaV     [1x1]  maneuver impulse                [km/s]
% omf        [1x1]  final pericenter anomaly        [rad]
% theta      [1x1]  true anomaly at maneuver        [rad]

function [DeltaV, omf, theta] = changeOrbitalPlane(a, e, i_i, OMi, omi, i_f, OMf, mu)

deltaOM = OMf - OMi;
deltai = i_f - i_i;
p = a * (1 - e^2);

alpha = acos(cos(i_i)*cos(i_f) + sin(i_i)*sin(i_f) * cos(abs(deltaOM)));

sui = sin(abs(deltaOM)) / sin(alpha)*sin(i_f);
suf = sin(abs(deltaOM)) / sin(alpha)*sin(i_i);

if deltaOM > 0 && deltai > 0
    cui = (-cos(i_f) + cos(alpha)*cos(i_i)) / (sin(alpha) * sin(i_i));
    ui = atan2(sui, cui);
    
    cuf = (cos(i_i) - cos(alpha)*cos(i_f)) / (sin(alpha)*sin(i_f));
    uf = atan2(suf, cuf);
    
    theta = ui - omi;

    if cos(theta) > 0
        theta = theta + pi;
    end

    omf = uf - theta;

elseif deltaOM > 0 && deltai < 0
    cui = (cos(i_f) - cos(alpha)*cos(i_i)) / (sin(alpha)*sin(i_i));
    ui = atan2(sui, cui);

    cuf = (-cos(i_i) + cos(alpha)*cos(i_f)) / (sin(alpha)*sin(i_f));
    uf = atan2(suf, cuf);
    
    theta = 2 * pi - ui - omi;

    if cos(theta) > 0
        theta = theta + pi;
    end

    omf = 2 * pi - uf - theta;

elseif deltaOM < 0 && deltai > 0
    cui = (-cos(i_f) + cos(alpha)*cos(i_i)) / (sin(alpha)*sin(i_i));
    ui = atan2(sui, cui);

    cuf = (cos(i_i) - cos(alpha)*cos(i_f)) / (sin(alpha)*sin(i_f));
    uf = atan2(suf, cuf);

    theta = 2 * pi - ui - omi;

    if cos(theta) > 0
        theta = theta + pi;
    end

    omf = 2 * pi - uf - theta;

elseif deltaOM < 0 && deltai < 0
    cui = (cos(i_f) - cos(alpha)*cos(i_i)) / (sin(alpha)*sin(i_i));
    ui=atan2(sui, cui);

    cuf = (-cos(i_i) + cos(alpha)*cos(i_f)) / (sin(alpha)*sin(i_f));
    uf = atan2(suf, cuf);

    theta = ui - omi;

    if cos(theta) > 0
        theta = theta + pi;
    end
    
    omf = uf - theta;
end

DeltaV = 2 * sqrt(mu / p) * (1 + e * cos(theta)) * sin(alpha / 2);

if omf < 0
    omf = omf + 2 * pi;
end