def inner_prod(lista1,lista2):
    result=0
    if len(lista1)==len(lista2):
        for i in range(len(lista1)):
            result=result+lista1[i]*lista2[i]
    return result

def substraction(lista1,lista2):
    result=[]
    if len(lista1)==len(lista2):
        for i in range(len(lista1)):
            result.append(lista1[i]-lista2[i])
    return result

def right_shift(lista1):
    result=[0]
    for i in range(len(lista1)-1):
        result.append(lista1[i])
    return result

def left_shift(lista1):
    result=[]
    for i in range(1,len(lista1)):
        result.append(lista1[i])
    result.append(0)
    return result

def right_shift_n(lista1,n):
    result=lista1
    for i in range(n):
        result=right_shift(result)
    return result

def left_shift_n(lista1,n):
    result=lista1
    for i in range(n):
        result=left_shift(result)
    return result

def substitution(expr,list1,list2):
    result=expr
    for i in range(len(list1)):
        result=result.subs(list1[i],list2[i])
    return result