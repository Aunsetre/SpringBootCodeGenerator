<#if isAutoImport?exists && isAutoImport==true>
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;
</#if>

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
public interface ${classInfo.className}Dao {

    /**
    * 新增
    */
    Integer insert(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 刪除
    */
    Integer delete(Long id);

    /**
    * 更新
    */
    Integer update(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 查询 根据主键 id 查询
    */
    ${classInfo.className} selectOne(Long id);

    /**
    * 查询内容是否存在
    */
    Integer selectColumnIsExist(@Param("name") String name);

    /**
    * 查询 分页查询
    */
    List<${classInfo.className}VO> getList(@Param("offset") int offset, @Param("limit")int limit,
                                          @Param("keyword") String keyword);

    /**
    * 查询 分页查询 count
    */
    Integer getTotal(@Param("keyword") String keyword);

}
