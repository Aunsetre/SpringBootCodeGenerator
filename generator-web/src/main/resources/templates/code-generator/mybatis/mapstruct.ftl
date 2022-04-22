package com.guosen.platform.faas.sys.mapper;
<#if isAutoImport?exists && isAutoImport==true>
import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
</#if>

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Mapper(componentModel ="spring")
public interface ${classInfo.className}Mapper {
    /**
    * dto to entity
    **/
    @Mapping(target = "createTime" ,ignore = true)
    @Mapping(target = "updateTime" ,ignore = true)
    ${classInfo.className} to${classInfo.className} (${classInfo.className}DTO ${classInfo.className?uncap_first}DTO);
}