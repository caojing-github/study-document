_search使用 doc 获取值其他场景使用 ctx
_search操作是不会改变document的值的，即便是script_fields，你只能在当次查询是能看到script输出的值
doc['first.keyword']这样的写法是因为doc[]返回有可能是分词之后的value，所以你想要某个field的完整值时，请使用keyword

-----
[elasticsearch painless最强教程](https://blog.csdn.net/u013613428/article/details/78134170?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-4.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-4.nonecase)
[elasticsearch painless 用法](https://blog.csdn.net/chief_victo/article/details/101622505?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase)
[Elasticsearch Painless Script入门教程](https://blog.csdn.net/neweastsun/article/details/105035538?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase)
[elasticsearch painless最强教程 二](https://blog.csdn.net/u013613428/article/details/78135258?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.nonecase)