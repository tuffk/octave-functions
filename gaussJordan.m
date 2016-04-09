function [x, A, d, Solucion] = gaussJordan(M, b, op)

c=[M,b];
x=A=d=Solucion=0;

for i = 1: length(M)

  c(i,:)/=c(i,i);

for j=1:length(M)


  if(i!=j)

    temp = c(i,:)*-1*c(j,i);
    c(j,:)+=temp;


    c


  endif;
endfor;
endfor;
 
D=[c(1:length(M),1:length(M))];
  if(det(D)==0 || det(D) == NaN)
    return

  else

    x=[c(:,length(c))];
    A=inv(M);
    d=det(M);
    Solucion=op;

endif;
end;