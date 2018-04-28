#! /usr/bin/env python

import sys
import numpy as np
from matplotlib import pyplot as plt
import csv

train = sys.argv[1]
test = sys.argv[2]

#with open(train,'r') as f:
 #   reader = csv.reader(f, delimiter=',')
  #  n_train = sum(1 for row in reader)
   # for row in reader:
    #    X_train=np.array(row[0])
     #   X_train.shape=(n_train,1)
      #  y_train=np.array(row[1])
       # y_train.shape=(n_train,1)
n_train = sum(1 for row in csv.reader(open(train)))-1


X_train=np.genfromtxt(train,delimiter=',',skip_header=1,usecols=0)
y_train=np.genfromtxt(train,delimiter=',',skip_header=1,usecols=1)

a = np.ones(n_train)
#print (y_train.shape)
#X_train=np.insert(X_train, 0, values=a, axis=1)
X_train=np.c_[ np.ones(n_train), X_train ]
#print (X_train.shape)

w=np.random.rand(2,1)
b=np.matmul(w.transpose(),X_train.transpose())
plt.plot(X_train[:,1],y_train,'ro',X_train[:,1],b.transpose())
plt.show()
vec1=np.linalg.inv(np.matmul(X_train.transpose(),X_train))
vec2=np.matmul(X_train.transpose(),y_train)
w_direct=np.matmul(vec1,vec2)
c=np.matmul(w_direct.transpose(),X_train.transpose())
plt.plot(X_train[:,1],y_train,'ro',X_train[:,1],c.transpose())
plt.show()
eta=0.00000001
for nepoch in range(2) :
 for j in  range(n_train):
   #d=np.matmul(w.transpose(),X_train.transpose())
  #e=np.matmul((d- y.transpose()),X_train.transpose()) #eta = 0.00000001 
   #w=w-eta*e

   d=np.matmul(w.transpose(),X_train[j,:].transpose())
   e=np.matmul(np.array([d-y_train[j],d-y_train[j]]).transpose(),X_train[j,:])
   w=w-eta*e.transpose()

   if j%10000 == 0:
    g=np.matmul(w.transpose(),X_train.transpose())
    plt.plot(X_train[:,1],y_train,'ro',X_train[:,1],g.transpose())
    plt.show()


h=np.matmul(w.transpose(),X_train.transpose())
#print (h.shape)
plt.plot(X_train[:,1],y_train,'ro',X_train[:,1],h.transpose())
plt.show()


#with open(test,'r') as f:
 #   reader = csv.reader(f, delimiter=',')
  #  n_test = sum(1 for row in reader)
   # for row in reader:
    #    X_test=np.array(row[0])
     #   X_test.shape=(n_test,1)
      #  y_test=np.array(row[1])
       # y_test.shape=(n_test,1)

n_test = sum(1 for row in csv.reader(open(test)))-1


X_test=np.genfromtxt(test,delimiter=',',skip_header=1,usecols=0)
y_test=np.genfromtxt(test,delimiter=',',skip_header=1,usecols=1)

x = np.ones(n_test)
#X_test=np.insert(X_test, 1, values=x, axis=1)
X_test=np.c_[ np.ones(n_test), X_test ]

y_pred1=np.matmul(w.transpose(),X_test.transpose())
#print (y_pred1.shape)
#print (y_test.shape)
rms_error_y1=np.sqrt(((y_pred1 - y_test) ** 2).mean())
print ("RMS Error when w_final is used: %s" %(rms_error_y1))

y_pred2=np.matmul(w_direct.transpose(),X_test.transpose())
rms_error_y2=np.sqrt(((y_pred2 - y_test) ** 2).mean())
print ("RMS Error when w_direct is used: %s" %(rms_error_y2))
