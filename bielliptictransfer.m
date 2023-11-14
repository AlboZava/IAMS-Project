function [DeltaV1, DeltaV2, DeltaV3, Deltat1, Deltat2] = bielliptictransfer(ai, ei, af, ef, ra_t, mu)

% Bitangent transfer for elliptic orbits
% 
% [DeltaV1, DeltaV2, DeltaV3, Deltat1, Deltat2]= bitangentTransfer (ai, ei, af, ef, type, mu)
%
% -----------------------------------------------------------------------------------
% Input arguments:
% ai            [1x1]    initial semi-major axis            [km]
% ei            [1x1]    initial eccentricity               [-]
% af            [1X1]    final semi-major axis              [km]
% ef            [1x1]    final eccentricity                 [-]
% ra_t          [1x1]    transfer orbits apocenter distance [km]
% mu            [1x1]    gravitational parameter            [km^3/s^2]
%
% -----------------------------------------------------------------------------------
% Output arguments:
% DeltaV1       [1x1]    1st maneuver impulse               [km/s]
% DeltaV2       [1x1]    2nd maneuver impulse               [km/s]
% DeltaV3       [1x1]    3nd maneuver impulse               [km/s]
% Deltat1       [1x1]    maneuver time 1                    [s]
% Deltat2       [1x1]    maneuver time 2                    [s]
%


rp_T1=ai*(1-ei);

rp_i=rp_T1;

ra_T1=ra_t;

ra_T2=ra_t;

rp_T2=af*(1-ef);

rp_f=rp_T2;

a_T1=(rp_T1+ra_T1)/2;

a_T2=(rp_T2+ra_T2)/2;

vp_T1=sqrt(mu)*sqrt(2/rp_T1-1/a_T1);

vp_i=sqrt(mu)*sqrt(2/rp_i-1/ai);

DeltaV1=abs(vp_T1-vp_i);   %metto valore assoluto, segno sarà sempre positivo

va_T2=sqrt(mu)*sqrt(2/ra_T2-1/a_T2);

va_T1=sqrt(mu)*sqrt(2/ra_T1-1/a_T1);

DeltaV2=abs(va_T2-va_T1);

vp_f=sqrt(mu)*sqrt(2/rp_f-1/af);

vp_T2=sqrt(mu)*sqrt(2/rp_T2-1/a_T2);

DeltaV3=abs(vp_f-vp_T2);

Deltat1=pi*sqrt((a_T1^3)/mu);

Deltat2=pi*sqrt((a_T2^3)/mu);


