clc
n=5;
ip=fopen ('Directinspection.ip','r+');
op=fopen('Directinspection.op','w+');
a=fscanf(ip,'%g',[7,7]);
b=a';
L=b(:,1);
Lp=b(:,2);
Lq=b(:,3);
r=b(:,4);
x=b(:,5);
Ycp=b(:,6);
Ycq=b(:,7);
fprintf(op,'\t\t\t\t\t\tFormation of Ybus using Direct Inspection method:\n\n');
fprintf(op,'Input Line DATA:------>\n');
fprintf(op,'Lp\t\tLq\t\tr\t\t\tx\t\t\tYcp\t\t\tYcq\n');
for k=1:7
fprintf(op,'%d\t\t%d\t%f\t%f\t%f\t%f',Lp(k),Lq(k),r(k),x(k),Ycp(k),Ycq(k));
fprintf(op,'\n');
end;
fprintf(op,'\n\n');
fprintf(op,'Line Admitances:---->\n');
for k=1:7
Yline(k)=1/complex(r(k),x(k));
fprintf(op,'\nYline(%d)=(%2f)+j(%2f)',k,real(Yline(k)),imag(Yline(k)));
end;
fprintf(op,'\n\n');
for i=1:n
for j=1:n
Y(i,j)=complex(0,0);
end;
end;
p=Lp;
q=Lq;
for k=1:7
Y(p(k),p(k))=Y(p(k),p(k))+Yline(k)+Ycp(k);
Y(q(k),q(k))=Y(q(k),q(k))+Yline(k)+Ycq(k);
Y(p(k),q(k))=Y(p(k),q(k))-Yline(k);
Y(q(k),p(k))=Y(p(k),q(k));
end;
fprintf(op,'Ybus MATRIX:----->\n\n');
for i=1:5
for j=1:5
fprintf(op,'\t(%2f) + j(%2f)',real(Y(i,j)),imag(Y(i,j)));
end;
fprintf(op,'\n');
end;
fclose(ip);
fclose(op);
fclose all;
