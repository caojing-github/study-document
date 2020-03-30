#常用代码片段  
```shell script
<if test="ids!=null">
	<!-- and id in(1,2,3,4) -->
	<foreach collection="ids" open="and id in(" close=")" separator="," item="id">
		#{id}
	</foreach>
</if>
```

