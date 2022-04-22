<#if isAutoImport?exists && isAutoImport==true>
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

	@Autowired
	private ${classInfo.className}Dao ${classInfo.className?uncap_first}Dao;

	@Autowired
    private ${classInfo.className}Mapper ${classInfo.className?uncap_first}Mapper;


	@Override
	public boolean insert(${classInfo.className}DTO ${classInfo.className?uncap_first}DTO) {
        ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Mapper.to${classInfo.className}(${classInfo.className?uncap_first}DTO);

		return ${classInfo.className?uncap_first}Dao.insert(${classInfo.className?uncap_first}) != 0;
	}


	@Override
	public boolean delete(Long id) {
		return ${classInfo.className?uncap_first}Dao.delete(id) != 0;
	}


	@Override
	public boolean update(${classInfo.className}DTO ${classInfo.className?uncap_first}DTO) {
	    ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Mapper.to${classInfo.className}(${classInfo.className?uncap_first}DTO);
	    return ${classInfo.className?uncap_first}Dao.update(${classInfo.className?uncap_first}) != 0;
	}

	@Override
	public JSONObject getList(int page, int limit, String keyword) {
	    JSONObject result = new JSONObject();
        int offset = (page - 1) * limit;
        List<${classInfo.className}VO> list = ${classInfo.className?uncap_first}Dao.getList(offset, limit, keyword);
        Integer count = ${classInfo.className?uncap_first}Dao.getTotal(keyword);
        result.put("list", list);
        result.put("count", count);

		return result;
	}

	private void columnIsExist(${classInfo.className}DTO ${classInfo.className?uncap_first}DTO) {
            String key = ${classInfo.className?uncap_first}DTO.getEnvTypeKey();
            String name = ${classInfo.className?uncap_first}DTO.getName();
            boolean keyIsExist = ${classInfo.className?uncap_first}Dao.selectColumnIsExist(key, null) != 0;
            boolean nameIsExist = ${classInfo.className?uncap_first}Dao.selectColumnIsExist(null, name) != 0;
            if (keyIsExist) {
                throw new BizException("已存在");
            }
            if (nameIsExist) {
                throw new BizException("已存在");
            }
    }

    private void idIsExist(Long id) {
            if (${classInfo.className?uncap_first}Dao.load(id) == null) {
                throw new BizException("数据不存在", false);
            }
    }

}
