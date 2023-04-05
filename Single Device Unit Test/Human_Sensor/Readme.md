# This is a demo about bluetooth

接上IIC的 GPIO 2 3是不行的，一直读出来都是1,因此我认为IIC的树mei派内部IIC两个接口可能加了上拉电阻。

我试了串口的两个可以。

因此建议最好还是使用GPIO口原来的功能。在普通GPIO口确实用完的情况下，再选择改其他IO口的功能。
