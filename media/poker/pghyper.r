
pghyper=function(nselected,ndistinct,Ndistinct,Ncopies)
{
  TotalCardsNumber=Ndistinct*Ncopies
  if(TotalCardsNumber<nselected)
    stop("the number of selected exceeds the total number.")
  if(Ndistinct<ndistinct)
    return(0)
  if(nselected<ndistinct)
    return(0)
  if(ndistinct*Ncopies<nselected)
    return(0)
  TotalChoices=choose(TotalCardsNumber,nselected)
  if(ndistinct==1)
    return(Ndistinct*choose(Ncopies,nselected)/TotalChoices)
  if(nselected==ndistinct)
  {
    dchoices=choose(Ndistinct,ndistinct)
    multiple=Ncopies^ndistinct
    if(dchoices<multiple)
      return(multiple/(TotalChoices/dchoices))
    else
      return(dchoices/(TotalChoices/multiple))
  }
  result=NULL
  for(i in 1:ndistinct)
    result=c(result,pghyper(i,i,Ndistinct,Ncopies))
  for(i in 2:(nselected-ndistinct+1))
  {
    result[1]=pghyper(i,1,Ndistinct,Ncopies)
    for(j in 2:ndistinct)
    {
      n=j-1+i
      nleft=TotalCardsNumber-n+1
      result[j]=result[j]*(j*Ncopies-n+1)/nleft
                    +result[j-1]*(Ndistinct-j+1)*Ncopies/nleft
    }
  }
  result[ndistinct]
}

> pghyper(54*1,54,54,4)
[1] 9.19323e-20
> pghyper(54*2,54,54,4)
[1] 0.01908814
> pghyper(54*3,54,54,4)
[1] 0.8202961
\end{verbatim}
