% face
radius = 0.06;

lengTh = radius * ones(1,36);

angleInDeg = 0:10:350;

angleInRad = angleInDeg * pi/180;

Xd_face = lengTh.*cos(angleInRad);
Yd_face = lengTh.*sin(angleInRad);

% left eye
radius = 0.045;

lengTh = radius * ones(1,6);

angleInDeg = 120:6:150;

angleInRad = angleInDeg * pi/180;

Xd_leftI = lengTh.*cos(angleInRad);
Yd_leftI = lengTh.*sin(angleInRad);

% right eye

angleInDeg = 30:6:60;

angleInRad = angleInDeg * pi/180;

Xd_rightI = lengTh.*cos(angleInRad);
Yd_rightI = lengTh.*sin(angleInRad);

% smile
lengTh = radius * ones(1,16);

angleInDeg = -45:-6:-135;

angleInRad = angleInDeg * pi/180;

Xd_smile = lengTh.*cos(angleInRad);
Yd_smile = lengTh.*sin(angleInRad);

Xd = [Xd_leftI, Xd_rightI, Xd_smile, Xd_face];
Yd = [Yd_leftI, Yd_rightI, Yd_smile, Yd_face];

plot(Xd, Yd);
