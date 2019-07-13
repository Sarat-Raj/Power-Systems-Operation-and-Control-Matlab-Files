clc;
z=0.045+1i*0.4;
y=1i*4/1000000;
l=250;
op=fopen('abcd.op','w+');
gamma=sqrt(z*y);
zc=sqrt(z/y);
a=cosh(gamma*l);
b=zc*sinh(gamma*l);
c=(1/zc)*sinh(gamma*l);
d=a;
abcd=[a b;c d];
Z=b;
Y=(2/zc)*tanh(gamma*(l/2));
fprintf(op,'seires Impedance z=(%f)+j(%f)\nShunt Admittance
y=(%f)+j(%f)\nGamma=(%f)+j(%f)\nCharacteristic Impedance
zc=(%f)+j(%f)\nA=(%f)+j(%f)\nB=(%f)+j(%f)\nC=(%f)+j(%f)\nD=(%f)+j(%f)\nPI Parameter
Z=(%f)+j(%f)\nPI Parameter
Y=(%f)+j(%f)\n',real(z),imag(z),real(y),imag(y),real(gamma),imag(gamma),real(zc),imag(zc),re
al(a),imag(a),real(b),imag(b),real(c),imag(c),real(d),imag(d),real(Z),imag(Z),real(Y),imag(Y));
fclose all;
