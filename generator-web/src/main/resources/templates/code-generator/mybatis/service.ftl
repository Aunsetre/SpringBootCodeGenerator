<#if isAutoImport?exists && isAutoImport==true>
import java.util.Map;
import com.alibaba.fastjson.JSONObject;
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
public interface ${classInfo.className}Service {

    /**
    * 新增
    */
    boolean insert(${classInfo.className}DTO ${classInfo.className?uncap_first}DTO);

    /**
    * 删除
    */
    boolean delete(Long id);

    /**
    * 更新
    */
    boolean update(${classInfo.className}DTO ${classInfo.className?uncap_first}DTO);

    /**
    * 分页查询
    */
    JSONObject getList(int page, int limit, String keyword);

}
