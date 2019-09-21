if判断list
```
<#if importantList?? && (importantList?size > 0)>

</#if>
```
if判断,判断null
```
如果str不为null
<#if str??>

</#if>
```
对字符串进行比较
```
<#if str == "haha">

</#if>
或
<#if str != "haha">

</#if>
```
if elseif
```
<#if student.studentAge lt 12>
  	${student.studentName}不是一个初中生
<#elseif student.studentAge lt 15>
  	${student.studentName}不是一个高中生
<#elseif student.studentAge lt 18>
  	${student.studentName}不是一个大学生
<#else>
  	${student.studentName}是一个大学生
</#if>
```