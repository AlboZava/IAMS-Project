% Bitangent transfer for elliptic orbits
% 
% [DeltaV1, DeltaV2, Deltat] = bitangentTransfer(a_i, e_i, a_f, e_f, type, mu)
%
% -------------------------------------------------------------------------------------
% Input arguments:
% ai            [1x1]   initial semi-major axis             [km]
% ei            [1x1]   initial eccentricity                [-]
% af            [1x1]   final semi-major axis               [km]
% ef            [1x1]   fianl eccentricity                  [-]
% type          [char]  maneuver type
% mu            [1x1]   gravitational parameter             [km^3/s^2]
%
% ------------------------------------------------------------------------------------
% Output arguments:
% DeltaV1       [1x1]   1st maneuver impulse                [km/s]  
% DeltaV2       [1x1]   2nd maneuver impulse                [km/s]
% Deltat        [1x1]   maneuver time                       [s]
%
% ------------------------------------------------------------------------------------

function [DeltaV1, DeltaV2, Deltat] = bitangentTransfer(a_i, e_i, a_f, e_f, type, mu)

rp_i = a_i * (1 - e_i);
rp_f = a_f * (1 - e_f);
ra_i = a_i * (1 + e_i);
ra_f = a_f * (1 + e_f);

switch type
    case 'pa'
        rp_t = rp_i;
        ra_t = ra_f;
        a_t = (rp_t + ra_t) / 2;

        DeltaV1 = sqrt(mu) * sqrt(2 / rp_t - 1 / a_t) - sqrt(mu) * sqrt(2 / rp_i - 1 / a_i);
        DeltaV2 = sqrt(mu) * sqrt(2 / ra_f - 1 / a_f) - sqrt(mu) * sqrt(2 / ra_t - 1 / a_t);
    case 'ap'
        rp_t = rp_f;
        ra_t = ra_i;
        a_t = (rp_t + ra_t) / 2;

        DeltaV1 = sqrt(mu) * sqrt(2 / ra_t - 1 / a_t) - sqrt(mu) * sqrt(2 / ra_i - 1 / a_i);
        DeltaV2 = sqrt(mu) * sqrt(2 / rp_f - 1 / a_f) - sqrt(mu) * sqrt(2 / rp_t - 1 / a_t);
    case 'pp'
        rp_t = rp_i;
        ra_t = rp_f;
        a_t = (rp_t + ra_t) / 2;
        
        DeltaV1 = sqrt(mu) * sqrt(2 / rp_t - 1 / a_t) - sqrt(mu) * sqrt(2 / rp_i - 1 / a_i);
        DeltaV2 = sqrt(mu) * sqrt(2 / rp_f - 1 / a_f) - sqrt(mu) * sqrt(2 / ra_t - 1 / a_t);
    case 'aa'
        rp_t = ra_i;
        ra_t = ra_f;
        a_t = (rp_t + ra_t) / 2;
        
        DeltaV1 = sqrt(mu) * sqrt(2 / rp_t - 1 / a_t) - sqrt(mu) * sqrt(2 / ra_i - 1 / a_i);
        DeltaV2 = sqrt(mu) * sqrt(2 / ra_f - 1 / a_f) - sqrt(mu) * sqrt(2 / ra_t - 1 / a_t);

end

Deltat = pi * sqrt(a_t^3 / mu);