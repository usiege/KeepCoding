// 经过分析，发现此题实际上就是队列的基本操作，
// 唯一的不同就是在入队的时候，对于顺序进行了限制。

// 队列Q表示每次载渡的车辆，
// 队列Qp表示客车，
// Qt表示货车队列；

// 如果Qp中元素足够，
// 则每从队列Qp中出队4个元素，从队列Qt中出队1元素，
// 直到队列Q的长度为10；
// 若队列Qp中元素不充分，则直接使用队列Qt中的元素补齐

void manager(){

    if(car<4 && !IsEmpty(&Qp)){
        DeQueue(&Qp,&e);    //客车出队

        EnQueue(&Q,e);      //入渡
        count++;

        car++;
    }else if(car==4 && !IsEmpty(&Qt)){
        DeQueue(&Qt,&e);    //货车出队

        EnQueue(&Q,e);      //入渡
        count++;

        car=0;
    }else{
        //若无货车，客车补充
        while( count<=MaxSize && !IsEmpty(&Qp)){
            DeQueue(&Qp,&e);    //客车补充

            EnQueue(&Q,e);      //入渡
            count++;
        }
    }

    if(IsEmpty(&Qt) && IsEmpty(&Qp)){
        count=11;
    }
}