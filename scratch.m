% face
radius = 0.06;

length = radius * ones(1,36);

angleInDeg = 0:10:350;

angleInRad = angleInDeg * pi/180;

Xd_face = length.*cos(angleInRad);
Yd_face = length.*sin(angleInRad);

% left eye
radius = 0.045;

length = radius * ones(1,6);

angleInDeg = 120:6:150;

angleInRad = angleInDeg * pi/180;

Xd_leftI = length.*cos(angleInRad);
Yd_leftI = length.*sin(angleInRad);

% right eye

angleInDeg = 30:6:60;

angleInRad = angleInDeg * pi/180;

Xd_rightI = length.*cos(angleInRad);
Yd_rightI = length.*sin(angleInRad);

% smile
length = radius * ones(1,16);

angleInDeg = -45:-6:-135;

angleInRad = angleInDeg * pi/180;

Xd_smile = length.*cos(angleInRad);
Yd_smile = length.*sin(angleInRad);

Xd = [Xd_leftI, Xd_rightI, Xd_smile, Xd_face];
Yd = [Yd_leftI, Yd_rightI, Yd_smile, Yd_face];

plot(Xd, Yd);
