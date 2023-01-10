<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${packageName}.dao.${classInfo.className}Dao">

    <resultMap id="VOResultMap" type="${packageName}.vo.${classInfo.className}VO" >
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                <result column="${fieldItem.columnName}" property="${fieldItem.fieldName}" />
            </#list>
        </#if>
    </resultMap>

    <resultMap id="EntityResultMap" type="${packageName}.model.${classInfo.className}" >
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <result column="${fieldItem.columnName}" property="${fieldItem.fieldName}" />
                </#list>
            </#if>
    </resultMap>

    <sql id="Base_Column_List">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
            </#list>
        </#if>
    </sql>

    <insert id="insert"  parameterType="${packageName}.model.${classInfo.className}">
        INSERT INTO ${classInfo.originTableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <#if fieldItem.columnName != "id" >
                        <if test="null != ${fieldItem.fieldName} <#if fieldItem.fieldClass ="String">and '' != ${fieldItem.fieldName}</#if>">
                        ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
                        ${r"</if>"}
                    </#if>
                </#list>
            </#if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <#if fieldItem.columnName != "id" >
                    <#--<#if fieldItem.columnName="addtime" || fieldItem.columnName="updatetime" >
                    ${r"<if test ='null != "}${fieldItem.fieldName}${r"'>"}
                        NOW()<#if fieldItem_has_next>,</#if>
                    ${r"</if>"}
                    <#else>-->
                        <if test="null != ${fieldItem.fieldName} <#if fieldItem.fieldClass ="String">and '' != ${fieldItem.fieldName}</#if>">
                        ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
                        ${r"</if>"}
                    <#--</#if>-->
                    </#if>
                </#list>
            </#if>
        </trim>
    </insert>

    <delete id="delete" >
        DELETE FROM ${classInfo.originTableName}
        WHERE id = ${r"#{id}"}
    </delete>

    <update id="update" parameterType="${packageName}.model.${classInfo.className}">
        UPDATE ${classInfo.originTableName}
        <set>
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "AddTime" && fieldItem.columnName != "UpdateTime" >
                    <if test="null != ${fieldItem.fieldName} <#if fieldItem.fieldClass ="String">and '' != ${fieldItem.fieldName}</#if>">${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>${r"</if>"}
                </#if>
            </#list>
            update_time = GETDATE()
        </set>
        WHERE
            id = ${r"#{"}id${r"}"}
    </update>


    <select id="load" resultMap="EntityResultMap">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.originTableName}
        WHERE id = ${r"#{id}"}
    </select>

    <select id="selectColumnIsExist" resultType="java.lang.Integer">
            SELECT count(*)
            FROM ${classInfo.originTableName}
            <trim prefix="where" suffixOverrides=",">
                <if test="null != name and '' != name">
                    name =${r"#{name}"},
                </if>
            </trim>
    </select>

    <select id="getList" resultMap="VOResultMap">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.originTableName}
        <include refid="whereCondition"/>
        ORDER BY id desc OFFSET ${r"#{offset}"} ROWS FETCH NEXT ${r"#{limit}"} ROWS ONLY
    </select>

    <sql id="whereCondition">
        <where>
           <if test="keyword != null and keyword != ''">
             name like '%'+ ${r"#{keyword}"} +'%'
           </if>
        </where>
    </sql>

    <select id="getTotal" resultType="java.lang.Integer">
        SELECT count(1)
        FROM ${classInfo.originTableName}
        <include refid="whereCondition"/>
    </select>

</mapper>