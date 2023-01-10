<#if isAutoImport?exists && isAutoImport==true>
import java.io.Serializable;
import java.util.Date;
import java.util.List;
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
public class ${classInfo.className}DTO {

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    <#if isComment?exists && isComment==true>/**
    * ${fieldItem.fieldComment}
    */</#if>
   <#if fieldItem.fieldClass=='Integer'>
    @NotBlank(message= "${fieldItem.fieldComment}不能为空")
   </#if>
   <#if fieldItem.fieldClass=='String'>
    @NotNull(message= "${fieldItem.fieldComment}不能为空")
   </#if>
   <#if fieldItem.fieldClass=='List'>
    @NotEmpty(message= "${fieldItem.fieldComment}不能为空")
   </#if>
   <#if fieldItem.fieldLength?exists && fieldItem.fieldLength!=''>
    @Length(max=${fieldItem.fieldLength}, message="${fieldItem.fieldComment}长度不能超过${fieldItem.fieldLength}位")
   </#if>
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

</#list>
</#if>

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    public ${classInfo.className}() {
    }

<#list classInfo.fieldList as fieldItem>
    public ${fieldItem.fieldClass} get${fieldItem.fieldName?cap_first}() {
        return ${fieldItem.fieldName};
    }

    public void set${fieldItem.fieldName?cap_first}(${fieldItem.fieldClass} ${fieldItem.fieldName}) {
        this.${fieldItem.fieldName} = ${fieldItem.fieldName};
    }

</#list>
</#if>
}
