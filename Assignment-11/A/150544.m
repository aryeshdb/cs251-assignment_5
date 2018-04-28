clear
close all
[Train_x, Train_y] = textread('train.csv',"%f , %f");
sx=prod(size(Train_x));
sy=prod(size(Train_y));
st=1;

for i=1:sx
 if(isnan(Train_x(st)))  
    %disp(sx)
    st=st+1;
 else 
    break;
 end
end
One=ones(sx-st+1,1);
Train_x1=Train_x(st:sx);
Train_y=Train_y(st:sx);
figure(1)
plot(Train_x1,Train_y,'y');

Train_x=[One Train_x1];

w=rand(2,1);

hold on;
plot(Train_x,w'*Train_x','-r');

w_direct=inv(Train_x'*Train_x)*Train_x'*Train_y;

figure(2)
plot(Train_x1,Train_y,'y');
hold on;
plot(Train_x1,w_direct'*Train_x','-r');
eta=0.00000001;

for i=1:2
 for j=1:sx-st+1
  w=w-eta*(w'*(Train_x(j,:))'-Train_y(j))*(Train_x(j,:))';
  if(mod(j,100)==0)
   figure(3)
   plot(Train_x1,Train_y,'y');
   hold on;
   plot(Train_x1,w'*Train_x','-r');
   end
 end
end
figure(4)
   plot(Train_x1,Train_y,'y');
   hold on;
   plot(Train_x1,w'*Train_x','-r');

[Test_x, Test_y] = textread('test.csv',"%f , %f");
tx=prod(size(Test_x));
ty=prod(size(Test_y));
tt=1;

for i=1:tx
 if(isnan(Test_x(tt)))  
    %disp(tx)
    tt=tt+1;
 else 
    break;
 end
end
One=ones(tx-tt+1,1);
Test_x1=Test_x(tt:tx);
Test_y=Test_y(tt:tx);

Test_x=[One Test_x1];

y_pred1=Test_x*w;
y_pred2=Test_x*w_direct;

rms_1=sqrt(mean((y_pred1-Test_y).^2));
rms_2=sqrt(mean((y_pred2-Test_y).^2));

disp(sprintf("The Root-Mean-Squared Error between y_pred1 and y_test = %f",rms_1));
disp(sprintf("The Root-Mean-Squared Error between y_pred2 and y_test = %f",rms_2));